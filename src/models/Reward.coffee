mongoose = require 'mongoose'
Schema = mongoose.Schema

RewardSchema = new Schema
	name: String
	price: Number
	points: Number
	description: String
	img: String

mongoose.model 'Reward', RewardSchema
Reward = mongoose.model 'Reward'

module.exports = Reward