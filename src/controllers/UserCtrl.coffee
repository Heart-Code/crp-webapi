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
	@patchUser: (req, res) ->
		user = req.user
		if req.body.email then user.email = req.body.email
		if req.body.password then user.password = req.body.password
		if req.body.picture then user.picture = req.body.picture
		if req.body.name?.first then user.name.first = req.body.name.first
		if req.body.name?.last then user.name.last = req.body.name.last
		if req.body.phone then user.phone = req.body.phone
		user.save (err) ->
			if err then return res.send err
			res.send message: 'User updated'


module.exports = UserCtrl