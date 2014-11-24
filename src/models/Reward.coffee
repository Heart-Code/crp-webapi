mongoose = require 'mongoose'
Schema = mongoose.Schema

RewardSchema = new Schema
	name:
		type: String
		required: true
	value:
		type: Number
		required: true
	description: String
	picture: String
	expires: Date
	comments: [
		body: String
		date: Date
	]
	affiliate:
		type: Schema.Types.ObjectId
		required: true
	pointOfSales: [
		type: Schema.Types.ObjectId
		ref: 'PointOfSale'
	]

mongoose.model 'Reward', RewardSchema
Reward = mongoose.model 'Reward'

module.exports = Reward