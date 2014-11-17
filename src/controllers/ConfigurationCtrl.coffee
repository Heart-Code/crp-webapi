Configuration = require '../models/Configuration'

class ConfigurationCtrl
	@getAll: (req, res, next) ->
		Configuration.find {}, '-_id -__v', (err, list) ->
			res.send list

		next()

	@setUp: (req, res, next) ->
		Configuration.find (err, list) ->
			if list.length < 1
				configurations = [
					new Configuration { companyName: 'MultiTiendas', companyUrl: 'multitiendas.co.cr' }
				]
				
				for configuration in configurations			
					configuration.save()

				res.send 'Success'
			else
				res.send 'Already initialized'

		next()


module.exports = ConfigurationCtrl