AuthenticationCtrl = require '../controllers/AuthenticationCtrl'
OAuth2Ctrl = require '../controllers/OAuth2Ctrl'

AffiliateCtrl = require '../controllers/AffiliateCtrl'
ClientCtrl = require '../controllers/ClientCtrl'
UserCtrl = require '../controllers/UserCtrl'
ConfigurationCtrl = require '../controllers/ConfigurationCtrl'
ManagerCtrl = require '../controllers/ManagerCtrl'
RewardCtrl = require '../controllers/RewardCtrl'
RoleCtrl = require '../controllers/RoleCtrl'

{Router} = require 'express'

router = Router()

# User
router.route '/user'
  .post UserCtrl.postUser
  .get AuthenticationCtrl.isAuthenticated, UserCtrl.getCurrentUser
router.route '/users'
  .get UserCtrl.getUsers
router.route '/user/password'
  .patch AuthenticationCtrl.isAuthenticated, UserCtrl.updateUserPassword

# Client
router.route '/client'
  .post ClientCtrl.postClient
router.route '/clients'
  .get ClientCtrl.getClients

# Affiliate
router.route '/affiliates'
  .get AuthenticationCtrl.isAuthenticated, AffiliateCtrl.getAffiliates

# OAuth
router.route '/oauth2/token'
  .post AuthenticationCtrl.isClientAuthenticated, OAuth2Ctrl.token

module.exports = router