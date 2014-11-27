Points = require '../models/Points'
Affiliate = require '../models/Affiliate'
{uidCaps} = require '../utils/utils'

class PointsCtrl
  @postPoints: (req, res) ->
    Affiliate.findOne _id: req.body.affiliate, (err, affiliate) ->
      if err then return res.send err
      points = new Points()
      points.affiliate = affiliate.id
      points.amount = req.body.amount * affiliate.pointsPerDollar
      points.pointOfSale = req.body.pointOfSaleId
      points.code = "CRP#{uidCaps(8)}"

      points.save (err) ->
        # TODO: If it fails because of unique then try again
        if err then return res.send err
        res.send points

module.exports = PointsCtrl