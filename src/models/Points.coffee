mongoose = require 'mongoose'
Schema = mongoose.Schema

PointsSchema = new Schema
  affiliate:
    type: Schema.Types.ObjectId
    ref: 'Affiliate'
    required: true
  pointOfSale:
    type: Schema.Types.ObjectId
    ref: 'PointOfSale'
  code:
    type: String
    unique: true
    required: true
  amount:
    type: Number
    required: true
    min: 0
  created:
    type: Date
    default: Date.now
  # If the user is not undefined then the points have been exchanged
  user:
    type: Schema.Types.ObjectId
    ref: 'User'

PointsSchema.plugin require('mongoose-unique-validator')

module.exports = mongoose.model 'Points', PointsSchema