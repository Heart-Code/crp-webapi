mongoose = require 'mongoose'
Schema = mongoose.Schema

AccessTokenSchema = new Schema
  client:
    type: Schema.Types.ObjectId
    ref: 'Client'
    required: true
  user:
    type: Schema.Types.ObjectId
    ref: 'User'
    required: true
  token:
    type: String
    unique: true
    required: true
  scope:
    type: String
    required: true
  created:
    type: Date
    default: Date.now

module.exports = mongoose.model 'AccessToken', AccessTokenSchema