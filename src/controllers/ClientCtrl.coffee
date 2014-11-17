Client = require '../models/Client'

class ClientCtrl
  @postClient: (req, res) ->
    client = new Client
      name: req.body.name
      secret: req.body.secret

    client.save (err) ->
      if err then res.send err
      res.send client
  @getClients: (req, res) ->
    Client.find (err, clients) ->
      res.send clients

module.exports = ClientCtrl