bcrypt = require 'bcrypt-nodejs'
gravatar = require 'gravatar'

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
	points:
		type: Number
		default: 0
	picture: String
	rewardsRedeemed: [
		type: Schema.Types.ObjectId
		ref: 'Reward'
	]
	dateJoined:
		type: Date
		default: Date.now
	lastSignIn: Date
	status: String

UserSchema
	.virtual 'name.full'
	.get ->
		if @name.first?
			return "#{@name.first} #{@name.last}"
		else
			return undefined

UserSchema
	.virtual 'avatar'
	.get ->
		if @picture? && @picture.trim() isnt ''
			return @picture
		else
			return gravatar.url @email, s: '160', d: 'retro', r: 'pg'

UserSchema.pre 'save', (callback) ->
	user = this

	if !user.isModified('password') then return callback()
	bcrypt.genSalt 5, (err, salt) ->
		if err then return callback err
		bcrypt.hash user.password, salt, null, (err, hash) ->
			if err then return callback err
			user.password = hash
			callback()

UserSchema.set 'toJSON',
	virtuals: true # We want the response to include our virtuals

UserSchema.options.toJSON.transform = (doc, ret, options) ->
		if not ret._id? then delete ret.id
		ret

UserSchema.methods.passwordMatch = (password, callback) ->
	bcrypt.compare password, @password, (err, isMatch) ->
		if err then return callback err
		callback null, isMatch

# This is for prettying the error message when repeating email, this should be the default on mongoose
# There's a request (https://github.com/LearnBoost/mongoose/issues/2284), use this until it's implemented
# Besides this assigns the type as "user defined" we want something more specific
# TODO: Add to all schemas (?)
UserSchema.plugin require('mongoose-unique-validator')

module.exports = mongoose.model 'User', UserSchema