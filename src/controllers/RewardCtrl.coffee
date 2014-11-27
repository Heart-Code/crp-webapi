Reward = require '../models/Reward'

class RewardCtrl
	@getAll: (req, res) ->
		Reward.find {}, '-_id -__v', (err, list) ->
			res.send list

module.exports = RewardCtrl