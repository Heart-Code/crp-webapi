mongoose = require 'mongoose'
Schema = mongoose.Schema

ReceiptSchema = new Schema
  user:
    type: Schema.Types.ObjectId
    ref: 'User'
    required: true
  reward:
    type: Schema.Types.ObjectId
    ref: 'Reward'
    required: true
  code:
    type: String
    unique: true
    required: true
  created:
    type: Date
    default: Date.now
  expires:
    type: Date

ReceiptSchema.plugin require('mongoose-unique-validator')

module.exports = mongoose.model 'Receipt', ReceiptSchema