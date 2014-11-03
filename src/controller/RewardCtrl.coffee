Reward = require '../models/Reward'

class RewardCtrl
	@getAll: (req, res, next) ->
		Reward.find {}, '-_id -__v', (err, list) ->
			res.send list

		next()

	@setUp: (req, res, next) ->
		Reward.find (err, list) ->
			if list.length < 1
				rewards = [
					new Reward { name: 'This is a reward', affiliate: 'MegaTop', points: 35, img: 'http://placehold.it/50x50' }
					new Reward { name: 'Freezer', affiliate: 'Grolo', points: 325, img: 'http://placehold.it/50x50' }
					new Reward { name: 'Oven', affiliate: 'Zamona', points: 150, img: 'http://placehold.it/50x50' }
					new Reward { name: 'Ants Case', affiliate: 'Akimals', points: 52, img: 'http://placehold.it/50x50' }
					new Reward { name: 'Hawaiian Pizza', affiliate: 'Mama Johanna', points: 20, img: 'http://placehold.it/50x50' }
					new Reward { name: 'Soda', affiliate: 'Zote', points: 12, img: 'http://placehold.it/50x50' }
					new Reward { name: 'Toothpaste', affiliate: 'Roth', points: 5, img: 'http://placehold.it/50x50' }
				]
				
				for reward in rewards			
					reward.save()

				res.send 'Success'
			else
				res.send 'Already initialized'

		next()


module.exports = RewardCtrl