mongoose = require 'mongoose'
db = mongoose.connect 'mongodb://localhost/crp'
Schema = mongoose.Schema

ClientSchema = new Schema
	id: Schema.ObjectId
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