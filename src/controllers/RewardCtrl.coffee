Reward = require '../models/Reward'
Receipt = require '../models/Receipt'
{uidCaps} = require '../utils/utils'

class RewardCtrl
	@getRewards: (req, res) ->
		Reward.find {}, '-_id -__v', (err, list) ->
			res.send list

	@getRewardsByAffiliate: (req, res) ->
		Reward.find affiliate: req.body.affiliate, '-_id -__v', (err, list) ->
			res.send list

	@buyReward: (req, res) ->
		Reward.findOne _id: req.params.id, (err, reward) ->
			if err then return res.send err
			if not reward?
				return res.send errors: reward: type: 'reward does not exist', value: req.params.reward
			receipt = new Receipt()
			receipt.user = req.user.id
			receipt.reward = reward.id
			receipt.code = "CRP#{uidCaps(8)}R"

			receipt.save (err) ->
				if err then return res.send err
				res.send receipt: id: receipt.id

module.exports = RewardCtrl