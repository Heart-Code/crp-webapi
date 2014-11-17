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
					new Reward { id: mongoose.Types.ObjectId(), name: 'This is a reward', price: '15', points: 35, description: '', img: 'http://placehold.it/50x50' }
					new Reward { id: mongoose.Types.ObjectId(), name: 'Freezer', price: '300', points: 325, description: '', img: 'http://placehold.it/50x50' },
					new Reward { id: mongoose.Types.ObjectId(), name: 'Oven', price: '150', points: 150, description: '', img: 'http://placehold.it/50x50' },
					new Reward { id: mongoose.Types.ObjectId(), name: 'Ants Case', price: '23', points: 52, description: '', img: 'http://placehold.it/50x50' },
					new Reward { id: mongoose.Types.ObjectId(), name: 'Hawaiian Pizza', price: '6', points: 20, description: '', img: 'http://placehold.it/50x50' },
					new Reward { id: mongoose.Types.ObjectId(), name: 'Soda', price: '1.50', points: 12, description: '', img: 'http://placehold.it/50x50' },
					new Reward { id: mongoose.Types.ObjectId(), name: 'Toothpaste', price: '0.75', points: 5, description: '', img: 'http://placehold.it/50x50' }
				]
				
				for reward in rewards			
					reward.save()

				res.send 'Success'
			else
				res.send 'Already initialized'

		next()


module.exports = RewardCtrl