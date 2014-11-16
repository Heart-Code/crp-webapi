mongoose = require 'mongoose'
Schema = mongoose.Schema

ManagerSchema = new Schema
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