express = require 'express'
cors = require 'cors'
passport = require 'passport'
bodyParser = require 'body-parser'

routes = require './config/routes'

app = express()

# Middleware
app.use cors()
app.use bodyParser.json()
app.use passport.initialize()

app.use '/', routes
# Here we would add new versions if we needed one. e.g. app.use '/v2', routerv2

start = (port) ->
	app.listen port, ->
		console.log "CRP Web API service is listening at localhost:#{port}"

exports.start = start
exports.app = app