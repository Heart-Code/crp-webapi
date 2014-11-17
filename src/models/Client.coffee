mongoose = require 'mongoose'
Schema = mongoose.Schema

ClientSchema = new Schema
  name:
    type: String
    required: true
  secret:
    type: String
    required: true
  trusted:
    type: Boolean
    default: false

module.exports = mongoose.model 'Client', ClientSchema