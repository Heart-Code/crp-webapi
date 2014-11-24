mongoose = require 'mongoose'
Schema = mongoose.Schema

PointOfSaleSchema = new Schema
  name:
    type: String
    required: true
  latitude: Number
  longitude: Number
  description: String
  picture: String
  phones:
    type: [String]
    #TODO: Validation
  affiliate:
    type: Schema.Types.ObjectId
    ref: 'Affiliate'

mongoose.model 'PointOfSale', PointOfSaleSchema
PointOfSale = mongoose.model 'PointOfSale'

module.exports = PointOfSale