mongoose = require 'mongoose'
Receipt = require '../models/Receipt'

class ReceiptCtrl
  @getReceipt: (req, res) ->
    Receipt
      .findOne user: req.user.id, _id: req.params.id, exchanged: false, '-__v'
      .populate 'reward', '-_id -__v'
      .exec (err, receipt) ->
        if err then return res.send err
        # FIXME: Remove user
        res.send receipt: receipt

  @getReceipts: (req, res) ->
    Receipt
      .find user: req.user.id, exchanged: false,  '-__v'
      .populate 'reward', '-_id -__v'
      .exec (err, list) ->
        if err then return res.send err
        # FIXME: Remove user
        res.send list

  @exchangeReceipt: (req, res) ->
    Receipt
      .findOne code: req.params.code
      .populate 'user'
      .exec (err, receipt) ->
        if err then return res.send err
        receipt.exchanged = true
        receipt.save (err) ->
          if err then return res.send err
          res.send
            message: 'success'
            code: receipt.code
            user: receipt.user.email
            exchanged: receipt.exchanged

module.exports = ReceiptCtrl