mongoose = require 'mongoose'
db = mongoose.connect 'mongodb://localhost/crp'
Schema = mongoose.Schema

RewardSchema = new Schema
	name: String,
	points: Number,
	affiliate: String,
	img: String

mongoose.model 'Reward', RewardSchema
Reward = mongoose.model 'Reward'

module.exports = Reward