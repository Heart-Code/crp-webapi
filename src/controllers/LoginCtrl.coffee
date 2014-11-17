AuthorizationCode = require '../models/AuthorizationCode'

class LoginCtrl
  @login: (req, res, next) ->
    res.redirect '/oauth2/token'
    next()

module.exports = LoginCtrl