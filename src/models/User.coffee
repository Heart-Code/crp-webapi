bcrypt = require 'bcrypt-nodejs'
mongoose = require 'mongoose'
Schema = mongoose.Schema

UserSchema = new Schema
	email:
		type: String
		unique: true
		trim: true
		lowercase: true
		match: [/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/, 'Please fill a valid email address']
		required: true
	password:
		type: String
	name:
		first: String
		last: String
	phone: String
	rewardsRedeemed: [
		type: Schema.Types.ObjectId
		ref: 'Reward'
	]
	points:
		type: Number
		default: 0
	dateJoined:
		type: Date
		default: Date.now
	lastSignIn: Date
	status: String

UserSchema
	.virtual 'name.full'
	.get ->	"#{@name.first} #{@name.last}"

UserSchema.pre 'save', (callback) ->
	user = this

	if !user.isModified('password') then return callback()
	bcrypt.genSalt 5, (err, salt) ->
		if err then return callback err
		bcrypt.hash user.password, salt, null, (err, hash) ->
			if err then return callback err
			user.password = hash
			callback()

UserSchema.methods.passwordMatch = (password, callback) ->
	bcrypt.compare password, @password, (err, isMatch) ->
		if err then return callback err
		callback null, isMatch

module.exports = mongoose.model 'User', UserSchema