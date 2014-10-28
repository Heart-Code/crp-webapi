var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res) {
  var rewards = [{ 
  					name: "Tacos Reward",
  					points: "20pts",
  					affiliate: 'Taco bell',
  					img: 'http://placehold.it/50x50'

  				},
  				{ 
  					name: "Sandwich Reward",
  					points: "30pts",
  					affiliate: 'Subway',
  					img: 'http://placehold.it/50x50'

  				},{ 
  					name: "Computer Reward",
  					points: "40pts",
  					affiliate: 'Amazon',
  					img: 'http://placehold.it/50x50'

  				},{ 
  					name: "Web Site Reward",
  					points: "50pts",
  					affiliate: 'Web Designers',
  					img: 'http://placehold.it/50x50'

  				}] 	


  //res.send(JSON.stringify(rewards));
  res.setHeader('Content-Type', 'application/json');
  res.json(rewards);
});

module.exports = router;
