RewardCtrl = require './controller/RewardCtrl'
restify = require 'restify'
server = restify.createServer name: 'CRP Web API'

# Allow CORS
server.use restify.CORS()
server.use restify.fullResponse()

# Routing for rewards
server.get '/rewards', RewardCtrl.getAll
server.get '/rewards/init', RewardCtrl.setUp

server.listen 3000, ->
	console.log '%s listening at %s', server.name, server.url