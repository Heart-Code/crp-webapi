passport = require 'passport'
{BasicStrategy} = require 'passport-http'
BearerStrategy = require('passport-http-bearer').Strategy

User = require '../models/User'
Client = require '../models/Client'
AccessToken = require '../models/AccessToken'

passport.use new BasicStrategy (email, password, callback) ->
  User.findOne email: email, (err, user) ->
    if err then return callback err
    if !user then return callback null, false

    user.passwordMatch password, (err, isMatch) ->
      if err then return callback err
      if !isMatch then return callback null, false
      callback null, user

passport.use 'client-basic', new BasicStrategy (id, secret, callback) ->
  Client.findOne _id: id, (err, client) ->
    if err then return callback err
    if !client or client.secret isnt secret then return callback null, false
    callback null, client

# Here we evaluate the authentication with our own OAuth 2.0
passport.use new BearerStrategy (token, callback) ->
  AccessToken
    .findOne token: token
    .populate 'user'
    .exec (err, accessToken) ->
      if err then return callback err
      if !accessToken or !accessToken.user then return callback null, false

      callback null, accessToken.user, scope: accessToken.scope

# Here we could add third party authentications like Facebook and Google

class AuthenticationCtrl
  @isAuthenticated: passport.authenticate 'bearer', session: false
  @isUserAuthenticated: passport.authenticate 'basic', session: false
  @isClientAuthenticated: passport.authenticate 'client-basic', session : false


module.exports = AuthenticationCtrl