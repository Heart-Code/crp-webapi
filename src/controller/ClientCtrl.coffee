Client = require '../models/Client'

class ClientCtrl
	@getAll: (req, res, next) ->
		Client.find {}, '-_id -__v', (err, list) ->
			res.send list

		next()

	@setUp: (req, res, next) ->
		Client.find (err, list) ->
			if list.length < 1
				clients = [
					new Client { id: mongoose.Types.ObjectId(), firstName: 'Joel', lastName: 'Campbell', email: 'joel10@arsenal.com', phone: '2 144 88569478', rewardsRedeemed: [], currentPoints: 275, dateJoined: Date.now, lastSignIn: Date.now, status: 'active' },
					new Client { id: mongoose.Types.ObjectId(), firstName: 'Tony', lastName: 'Chopper', email: 'tonytonyc@mdd.com', phone: '', rewardsRedeemed: [], currentPoints: 275, dateJoined: Date.now, lastSignIn: Date.now, status: 'active' },
					new Client { id: mongoose.Types.ObjectId(), firstName: 'Nico', lastName: 'Robin', email: 'cienfleur_robin@acct.co.cr', phone: '4457859', rewardsRedeemed: [], currentPoints: 275, dateJoined: Date.now, lastSignIn: Date.now, status: 'active' },
					new Client { id: mongoose.Types.ObjectId(), firstName: 'Andres', lastName: 'Sirera', email: 'joel10@arsenal.com', phone: '789 4526', rewardsRedeemed: [], currentPoints: 275, dateJoined: Date.now, lastSignIn: Date.now, status: 'active' },
					new Client { id: mongoose.Types.ObjectId(), firstName: 'Will', lastName: 'Smith', email: 'joel10@arsenal.com', phone: '84569856', rewardsRedeemed: [], currentPoints: 275, dateJoined: Date.now, lastSignIn: Date.now, status: 'active' },
					new Client { id: mongoose.Types.ObjectId(), firstName: 'George', lastName: 'Constanza', email: 'joel10@arsenal.com', phone: '7485 7854', rewardsRedeemed: [], currentPoints: 275, dateJoined: Date.now, lastSignIn: Date.now, status: 'active' },
					new Client { id: mongoose.Types.ObjectId(), firstName: 'Bill', lastName: 'Cosby', email: 'joel10@arsenal.com', phone: '8845-8545', rewardsRedeemed: [], currentPoints: 275, dateJoined: Date.now, lastSignIn: Date.now, status: 'active' }
				]
				
				for client in clients			
					client.save()

				res.send 'Success'
			else
				res.send 'Already initialized'

		next()


module.exports = ClientCtrl