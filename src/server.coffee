AffiliateCtrl = require './controller/AffiliateCtrl'
ClientCtrl = require './controller/ClientCtrl'
ConfigurationCtrl = require './controller/ConfigurationCtrl'
ManagerCtrl = require './controller/ManagerCtrl'
RewardCtrl = require './controller/RewardCtrl'
RoleCtrl = require './controller/RoleCtrl'

restify = require 'restify'
server = restify.createServer name: 'CRP Web API'
mongoose = require 'mongoose'

# Allow CORS
server.use restify.fullResponse()

# Connect to mongoose
db = mongoose.connect 'mongodb://localhost/crp'

# Routing for affiliates
server.get '/affiliates', AffiliateCtrl.getAll
server.get '/affiliates/init', AffiliateCtrl.setUp

# Routing for clients
server.get '/clients', ClientCtrl.getAll
server.get '/clients/init', ClientCtrl.setUp

### Routing for configurations
server.get '/configurations', ConfigurationCtrl.getAll
server.get '/configurations/init', ConfigurationCtrl.setUp

# Routing for managers
server.get '/managers', ManagerCtrl.getAll
server.get '/managers/init', ManagerCtrl.setUp

# Routing for rewards
server.get '/rewards', RewardCtrl.getAll
server.get '/rewards/init', RewardCtrl.setUp

# Routing for roles
server.get '/roles', RoleCtrl.getAll
server.get '/roles/init', RoleCtrl.setUp###

server.listen 3000, ->
	console.log '%s listening at %s', server.name, server.url