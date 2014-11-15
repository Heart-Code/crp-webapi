Affiliate = require '../models/Affiliate'

class AffiliateCtrl
	@getAll: (req, res, next) ->
		Affiliate.find {}, '-_id -__v', (err, list) ->
			res.send list

		next()

	@setUp: (req, res, next) ->
		Affiliate.find (err, list) ->
			if list.length < 1
				managers = [
					new Affiliate { id: mongoose.Types.ObjectId(), description: 'Administrator' },
					new Affiliate { id: mongoose.Types.ObjectId(), description: 'Affiliate Manager' },
					new Affiliate { id: mongoose.Types.ObjectId(), description: 'Clerk' }
				]
				
				for affiliate in affiliates			
					affiliate.save()

				res.send 'Success'
			else
				res.send 'Already initialized'

		next()


module.exports = AffiliateCtrl