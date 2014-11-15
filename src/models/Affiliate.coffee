mongoose = require 'mongoose'
db = mongoose.connect 'mongodb://localhost/crp'
Schema = mongoose.Schema

AffiliateSchema = new Schema
	id: Schema.ObjectId
		name: String
		managers: 
			type: Array
			default: []
		rewards: 
			type: Array
			default: []
		pointsPerDollar: Number
		siteTemplate: String #This is not in the requirements.
		type:
			description: String
			location: String
			url: String
			phones: 
				type: Array
				default: []
				
mongoose.model 'Affiliate', AffiliateSchema
Affiliate = mongoose.model 'Affiliate'

module.exports = Affiliate