mongoose = require 'mongoose'
db = mongoose.connect 'mongodb://localhost/crp'
Schema = mongoose.Schema

ConfigurationSchema = new Schema
	companyName: String
	companyUrl: String
	newsletterRSS: String
	manualPointsInput: Boolean
	manualPointsInputInterval: Number #Seconds
	footerHtmlPlaceholder: String
	pointsPerDollar: Number
	assignPointsMethods: 
		type: Array
		default: []
	redeemRewardsMethods: 
		type: Array
		default: []

mongoose.model 'Configuration', ConfigurationSchema
Configuration = mongoose.model 'Configuration'

module.exports = Configuration