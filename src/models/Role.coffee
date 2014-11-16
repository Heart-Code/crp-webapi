mongoose = require 'mongoose'
Schema = mongoose.Schema

RoleSchema = new Schema
	description: String

mongoose.model 'Role', RoleSchema
Role = mongoose.model 'Role'

module.exports = Role