Reward = require '../models/Reward'

class RewardCtrl
	@getRewards: (req, res) ->
		Reward.find {}, '-_id -__v', (err, list) ->
			res.send list

	@getRewardsByAffiliate: (req, res) ->
		Reward.find affiliate: req.body.affiliate, '-_id -__v', (err, list) ->
			res.send list

module.exports = RewardCtrl