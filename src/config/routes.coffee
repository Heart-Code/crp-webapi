AuthenticationCtrl = require '../controllers/AuthenticationCtrl'
OAuth2Ctrl = require '../controllers/OAuth2Ctrl'

AffiliateCtrl = require '../controllers/AffiliateCtrl'
ClientCtrl = require '../controllers/ClientCtrl'
UserCtrl = require '../controllers/UserCtrl'
RewardCtrl = require '../controllers/RewardCtrl'
PointsCtrl = require '../controllers/PointsCtrl'
ReceiptCtrl = require '../controllers/ReceiptCtrl'

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
  .get AffiliateCtrl.getAffiliates

# Rewards
router.route '/rewards'
  .get RewardCtrl.getRewards
router.route '/reward/:id/buy'
  .post AuthenticationCtrl.isAuthenticated, RewardCtrl.buyReward

# Points
router.route '/points'
  .post PointsCtrl.postPoints

router.route '/points/:code'
  .post AuthenticationCtrl.isAuthenticated, PointsCtrl.addPoints

# Receipts
router.route '/receipts'
  .get AuthenticationCtrl.isAuthenticated, ReceiptCtrl.getReceipts
router.route '/receipt/:id'
  .get AuthenticationCtrl.isAuthenticated, ReceiptCtrl.getReceipt

# OAuth
router.route '/oauth2/token'
  .post AuthenticationCtrl.isClientAuthenticated, OAuth2Ctrl.token

module.exports = router