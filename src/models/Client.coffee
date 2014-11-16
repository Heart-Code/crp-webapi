mongoose = require 'mongoose'
Schema = mongoose.Schema

ClientSchema = new Schema
	firstName: String
	lastName: String
	email: String
	phone: String
	rewardsRedeemed:
		type: Array
		default: []
	currentPoints: Number
	dateJoined: Date
	lastSignIn: Date
	status: String

mongoose.model 'Client', ClientSchema
Client = mongoose.model 'Client'

module.exports = Client