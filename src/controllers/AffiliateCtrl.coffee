mongoose = require 'mongoose'
Affiliate = require '../models/Affiliate'

class AffiliateCtrl
	@getAffiliates: (req, res) ->
		Affiliate.find {}, '-_id -__v', (err, list) ->
			res.send list

	@postAffiliate: (req, res) ->
		affiliate = new Affiliate()
		affiliate.name = req.body.name
		affiliate.description = req.body.description
		affiliate.pointsPerDollar = req.body.pointsPerDollar
		affiliate.website = req.body.website

		affiliate.save (err) ->
			if err then return res.send err
			res.send affiliate

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