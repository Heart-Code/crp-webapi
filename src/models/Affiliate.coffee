mongoose = require 'mongoose'
Schema = mongoose.Schema

AffiliateSchema = new Schema
	name:
		type: String
		required: true
	description: String
	pointsPerDollar:
		type: Number
		required: true
	website: String
	picture: String
	rewards:
		type: [Schema.Types.ObjectId]
		ref: 'Reward'
	pointOfSales:
		type: [Schema.Types.ObjectId]
		ref: 'PointOfSale'

module.exports = mongoose.model 'Affiliate', AffiliateSchema