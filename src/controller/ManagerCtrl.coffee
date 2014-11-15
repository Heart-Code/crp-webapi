Manager = require '../models/Manager'

class ManagerCtrl
	@getAll: (req, res, next) ->
		Manager.find {}, '-_id -__v', (err, list) ->
			res.send list

		next()

	@setUp: (req, res, next) ->
		Manager.find (err, list) ->
			if list.length < 1
				managers = [
					new Manager { id: mongoose.Types.ObjectId(), firstName: 'Milton', lastName: 'Pineda', email: '', roleIds: [], status: 'active' },
					new Manager { id: mongoose.Types.ObjectId(), firstName: 'Milton', lastName: 'Pineda', email: '', roleIds: [], status: 'active' },
					new Manager { id: mongoose.Types.ObjectId(), firstName: 'Milton', lastName: 'Pineda', email: '', roleIds: [], status: 'active' },
					new Manager { id: mongoose.Types.ObjectId(), firstName: 'Milton', lastName: 'Pineda', email: '', roleIds: [], status: 'active' },
					new Manager { id: mongoose.Types.ObjectId(), firstName: 'Milton', lastName: 'Pineda', email: '', roleIds: [], status: 'active' },
					new Manager { id: mongoose.Types.ObjectId(), firstName: 'Milton', lastName: 'Pineda', email: '', roleIds: [], status: 'active' }
				]
				
				for manager in managers			
					manager.save()

				res.send 'Success'
			else
				res.send 'Already initialized'

		next()


module.exports = ManagerCtrl