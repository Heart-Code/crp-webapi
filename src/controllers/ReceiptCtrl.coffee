mongoose = require 'mongoose'
Receipt = require '../models/Receipt'

class ReceiptCtrl
  @getReceipts: (req, res) ->
    Receipt.find {}, '-_id -__v', (err, list) ->
      res.send list

module.exports = ReceiptCtrl