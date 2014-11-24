AuthenticationCtrl = require './controllers/AuthenticationCtrl'
OAuth2Ctrl = require './controllers/OAuth2Ctrl'

AffiliateCtrl = require './controllers/AffiliateCtrl'
ClientCtrl = require './controllers/ClientCtrl'
UserCtrl = require './controllers/UserCtrl'
ConfigurationCtrl = require './controllers/ConfigurationCtrl'
ManagerCtrl = require './controllers/ManagerCtrl'
RewardCtrl = require './controllers/RewardCtrl'
RoleCtrl = require './controllers/RoleCtrl'

express = require 'express'
cors = require 'cors'
passport = require 'passport'
mongoose = require 'mongoose'
bodyParser = require 'body-parser'

app = express()

# Middleware
app.use cors()
#app.use bodyParser.urlencoded extended: true
app.use bodyParser.json()
app.use passport.initialize()

# Connect to mongoose
db = mongoose.connect 'mongodb://localhost/crp'

router = express.Router()

router.route '/user'
	.post UserCtrl.postUser
	.get AuthenticationCtrl.isAuthenticated, UserCtrl.getCurrentUser
router.route '/users'
	.get UserCtrl.getUsers

router.route '/client'
	.post ClientCtrl.postClient
router.route '/clients'
	.get ClientCtrl.getClients

router.route '/affiliates'
	.get AuthenticationCtrl.isAuthenticated, AffiliateCtrl.getAffiliates

router.route '/oauth2/token'
	.post AuthenticationCtrl.isClientAuthenticated, OAuth2Ctrl.token

app.use '/', router
# Here we would add new versions if we needed one. e.g. app.use '/v2', routerv2

port = 3000
app.listen port, ->
	console.log "CRP Web API service is listening at localhost:#{port}"