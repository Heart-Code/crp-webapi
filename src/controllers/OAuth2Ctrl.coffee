oauth2oarize = require 'oauth2orize'
utils = require '../utils/utils'

User = require '../models/User'
Client = require '../models/Client'
AuthorizationCode = require '../models/AuthorizationCode'
AccessToken = require '../models/AccessToken'

server = oauth2oarize.createServer()

server.serializeClient (client, callback) ->
  callback null, client._id

server.deserializeClient (id, callback) ->
  Client.findOne _id: id, (err, client) ->
    if err then return callback err
    callback null, client

server.grant oauth2oarize.grant.code (client, redirectUri, user, ares, callback) ->
  code = utils.uid 16

  ac = new AuthorizationCode
    code: code
    client: client._id
    redirectUri: redirectUri
    user: user._id
    scope: ares.scope

  ac.save (err) ->
    if err then return callback err
    callback null, code

# grant_type code - third party applications
server.exchange oauth2oarize.exchange.code (client, code, redirectUri, callback) ->
  AuthorizationCode.findOne code: code, (err, ac) ->
    if err then return callback err
    if client._id isnt ac.client then return callback null, false
    if redirectUri isnt ac.redirectUri then return callback null, false

    ac.remove (err) ->
      if err then return callback err

      token = utils.uid 256
      at = new AccessToken
        token: token
        client: ac.client
        user: ac.user

      at.save (err) ->
        if err then callback err
        callback null, token

# grant_type password - trusted applications
server.exchange oauth2oarize.exchange.password (client, email, password, scope, callback) ->
  if !client.trusted then return callback new Error 'Client not trusted, use grant_type code instead'
  User.findOne email: email, (err, user) ->
    if err then return callback err
    user.passwordMatch password, (err, isMatch) ->
      if err then return callback err
      if !isMatch then return callback null, false
      token = utils.uid 256
      at = new AccessToken
        token: token
        client: client.id
        user: user.id
        scope: scope ? '*'

      at.save (err) ->
        if err then return callback err
        console.log token
        callback null, token

class OAuth2Ctrl
  @authorization: [
    server.authorization (clientId, redirectUri, callback) ->
      Client.findOne _id: clientId, (err, client) ->
        if err then return callback err
        callback null, client, client.redirectUri
    (req, res) ->
      res.render 'dialog', transactionID: req.oauth2.transactionID, user: req.user, client: req.oauth2.client
  ]
  @decision: [
    server.decision()
  ]
  @token: [
    server.token()
    server.errorHandler()
  ]

module.exports = OAuth2Ctrl