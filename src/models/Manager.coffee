mongoose = require 'mongoose'
db = mongoose.connect 'mongodb://localhost/crp'
Schema = mongoose.Schema

ManagerSchema = new Schema
	id: Schema.ObjectId
	firstName: String
	lastName: String
	email: String
	roleIds:
	  type: Array
	  default: []
	status: String

mongoose.model 'Manager', ManagerSchema
Manager = mongoose.model 'Manager'

module.exports = Manager