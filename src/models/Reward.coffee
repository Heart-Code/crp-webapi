mongoose = require 'mongoose'
db = mongoose.connect 'mongodb://localhost/crp'
Schema = mongoose.Schema

RewardSchema = new Schema
	id: Schema.ObjectId
	name: String
	price: Number
	points: Number
	description: String
	img: String

mongoose.model 'Reward', RewardSchema
Reward = mongoose.model 'Reward'

module.exports = Reward