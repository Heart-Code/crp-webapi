mongoose = require 'mongoose'
db = mongoose.connect 'mongodb://localhost/crp'
Schema = mongoose.Schema

RoleSchema = new Schema
	id: Schema.ObjectId
	description: String

mongoose.model 'Role', RoleSchema
Role = mongoose.model 'Role'

module.exports = Role