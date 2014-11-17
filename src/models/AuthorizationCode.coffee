mongoose = require 'mongoose'
Schema = mongoose.Schema

AutherizationCodeSchema = new Schema
  client:
    type: Schema.Types.ObjectId
    ref: 'Client'
    required: true
  user:
    type: Schema.Types.ObjectId
    ref: 'User'
    required: true
  code:
    type: String
    unique: true
    required: true
  redirectUri:
    type: String
    required: true
  scope:
    type: String
    required: true

module.exports = mongoose.model 'AutherizationCode', AutherizationCodeSchema