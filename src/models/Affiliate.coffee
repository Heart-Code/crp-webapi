mongoose = require 'mongoose'
Schema = mongoose.Schema

AffiliateSchema = new Schema
	name: String
	managers:
		type: Array
		default: []
	rewards: [
		type: Schema.Types.ObjectId
		ref: 'Reward'
	]
	pointsPerDollar: Number
	siteTemplate: String #This is not in the requirements.
	type:
		description: String
		location: String
		url: String
		phones:
			type: Array
			default: []

module.exports = mongoose.model 'Affiliate', AffiliateSchema