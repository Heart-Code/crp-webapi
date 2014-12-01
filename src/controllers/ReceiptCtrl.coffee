mongoose = require 'mongoose'
Receipt = require '../models/Receipt'

class ReceiptCtrl
  @getReceipt: (req, res) ->
    Receipt
      .findOne user: req.user.id, _id: req.params.id , '-_id -__v'
      .populate 'reward', '-_id -__v'
      .exec (err, receipt) ->
        if err then return res.send err
        # FIXME: Remove user
        res.send receipt: receipt

  @getReceipts: (req, res) ->
    Receipt
      .find user: req.user.id, '-_id -__v'
      .populate 'reward', '-_id -__v'
      .exec (err, list) ->
        if err then return res.send err
        # FIXME: Remove user
        res.send list

module.exports = ReceiptCtrl