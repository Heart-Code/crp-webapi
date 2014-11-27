AuthenticationCtrl = require '../controllers/AuthenticationCtrl'
OAuth2Ctrl = require '../controllers/OAuth2Ctrl'

AffiliateCtrl = require '../controllers/AffiliateCtrl'
ClientCtrl = require '../controllers/ClientCtrl'
UserCtrl = require '../controllers/UserCtrl'
ConfigurationCtrl = require '../controllers/ConfigurationCtrl'
RewardCtrl = require '../controllers/RewardCtrl'
RoleCtrl = require '../controllers/RoleCtrl'
PointsCtrl = require '../controllers/PointsCtrl'

{Router} = require 'express'

router = Router()

# User
router.route '/user'
  .post UserCtrl.postUser
  .get AuthenticationCtrl.isAuthenticated, UserCtrl.getCurrentUser
  .patch AuthenticationCtrl.isAuthenticated, UserCtrl.patchUser
router.route '/users'
  .get UserCtrl.getUsers

# Client
router.route '/client'
  .post ClientCtrl.postClient
router.route '/clients'
  .get ClientCtrl.getClients

# Affiliate
router.route '/affiliate'
  .post AffiliateCtrl.postAffiliate
router.route '/affiliates'
  .get AuthenticationCtrl.isAuthenticated, AffiliateCtrl.getAffiliates

# Points
router.route '/points'
  .post PointsCtrl.postPoints

# OAuth
router.route '/oauth2/token'
  .post AuthenticationCtrl.isClientAuthenticated, OAuth2Ctrl.token

module.exports = router