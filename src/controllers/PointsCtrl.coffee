Points = require '../models/Points'
Affiliate = require '../models/Affiliate'
{uidCaps} = require '../utils/utils'
MongooseError = require 'mongoose/lib/error'

class PointsCtrl
  @getPoints: (req, res) ->
    Points.find user: undefined, (err, points) ->
      if err then return res.send err
      res.send points
  @postPoints: (req, res) ->
    Affiliate.findOne _id: req.body.affiliate, (err, affiliate) ->
      if err then return res.send err
      points = new Points()
      points.affiliate = affiliate.id
      points.amount = req.body.amount * affiliate.pointsPerDollar
      points.pointOfSale = req.body.pointOfSale
      points.code = "CRP#{uidCaps(8)}P"

      points.save (err) ->
        # TODO: If it fails because of unique then try again
        if err then return res.send err
        res.send code: points.code, amount: points.amount
  @addPoints: (req, res) ->
    Points.findOne code: req.params.code, (err, points) ->
      if err then return res.send err
      if points is null
        error =
          errors:
            code:
              type: 'invalid code'
              value: req.params.code
        return res.send error
      if points.user?
        error = new MongooseError.ValidationError points
        error.errors.user = new MongooseError.ValidatorError 'user', '', 'points already exchanged', req.user.id
        return res.send error
      points.user = req.user.id
      points.save (err) ->
        if err then return res.send err
        req.user.points += points.amount
        req.user.save (err) ->
          if err then return res.send err
          res.send user:
            points: req.user.points

module.exports = PointsCtrl