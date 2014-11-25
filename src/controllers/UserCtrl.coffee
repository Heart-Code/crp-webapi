User = require '../models/User'

class UserCtrl
	@postUser: (req, res) ->
		user = new User
			email: req.body.email
			password: req.body.password

		user.save (err) ->
			if err then return res.send err
			res.send user
	@getUsers: (req, res) ->
		User.find {}, '-_id -__v', (err, users) ->
			if err then return res.send err
			res.send users
	@getCurrentUser: (req, res) ->
		User.findOne _id: req.user.id, '-_id -__v -id -password', (err, user) ->
			if err then return res.send err
			user.toJSON.hide = 'id'
			res.send { user }
	@verify: (req, res) ->
		User.findOne email: req.query.email, (err, user) ->
			if err then return res.send err
			if !user then return res.send message: 'Not user found'

			user.passwordMatch req.query.password, (err, isMatch) ->
				if err then return res.send err
				if !isMatch then res.send message: 'Password not matched'
				res.send user
	@updateUserPassword: (req, res) ->
		user = req.user
		user.password = req.body.password
		user.save (err) ->
			if err then return res.send err
			res.send user


module.exports = UserCtrl