Role = require '../models/Role'

class RoleCtrl
	@getAll: (req, res, next) ->
		Role.find {}, '-_id -__v', (err, list) ->
			res.send list

		next()

	@setUp: (req, res, next) ->
		Role.find (err, list) ->
			if list.length < 1
				managers = [
					new Role { id: mongoose.Types.ObjectId(), description: 'Administrator' },
					new Role { id: mongoose.Types.ObjectId(), description: 'Affiliate Manager' },
					new Role { id: mongoose.Types.ObjectId(), description: 'Clerk' }
				]
				
				for role in roles			
					role.save()

				res.send 'Success'
			else
				res.send 'Already initialized'

		next()


module.exports = RoleCtrl