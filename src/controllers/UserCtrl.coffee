User = require '../models/User'

class UserCtrl
	@postUser: (req, res) ->
		user = new User
			email: req.body.email
			password: req.body.password

		user.save (err) ->
			if err then res.send err
			res.send user
	@getUsers: (req, res) ->
		User.find {}, '-_id -__v', (err, users) ->
			if err then res.send err
			res.send users
	# TODO: Remove, this was done just for testing
	@verify: (req, res) ->
		User.findOne email: req.query.email, (err, user) ->
			if err then res.send err
			if !user then res.send message: 'Not user found'

			user.passwordMatch req.query.password, (err, isMatch) ->
				if err then res.send err
				if !isMatch then res.send message: 'Password not matched'
				res.send user


module.exports = UserCtrl