mongoose = require 'mongoose'
Affiliate = require '../models/Affiliate'

class AffiliateCtrl
	@getAll: (req, res, next) ->
		Affiliate.find {}, '-_id -__v', (err, list) ->
			res.send list

		next()

	@setUp: (req, res, next) ->
		Affiliate.find (err, list) ->
			if list.length < 1
				affiliates = [
					new Affiliate { id: mongoose.Types.ObjectId(), name: 'Taco Bell' },
					new Affiliate { id: mongoose.Types.ObjectId(), name: 'Orlando' },
					new Affiliate { id: mongoose.Types.ObjectId(), name: 'Adidas' }
				]
				
				for affiliate in affiliates
					affiliate.save()

				res.send 'Success'
			else
				res.send 'Already initialized'

		next()


module.exports = AffiliateCtrl