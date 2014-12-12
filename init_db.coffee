mongoose = require 'mongoose'
{ObjectId} = mongoose.Types
env = process.env.NODE_ENV || 'development'
config = require "./src/config/#{env}"
{argv} = require 'yargs'
colors = require 'colors'

Client = require './src/models/Client'
User = require './src/models/User'
Affiliate = require './src/models/Affiliate'
PointOfSale = require './src/models/PointOfSale'
Reward = require './src/models/Reward'
Points = require './src/models/Points'
Receipt = require './src/models/Receipt'

complete = 0
total = 5

created = ->
  complete++
  if complete >= total
    process.exit()

# Connect to mongoose
db = mongoose.connect config.mongo.db, ->
  # Make an empty database
  mongoose.connection.db.dropDatabase()

  client = new Client
    "_id" : ObjectId("546a239d5021eee0313af9d1")
    "name" : "CRP Mobile Application"
    "secret" : "7H1515A53C437"
    "trusted" : true

  client.save ->
    console.log 'Client created!'.green
    created()

  users = [
    { "email": "erid14@gmail.com", "password": "123", "_id": ObjectId("547cc76de955a8a82cb6048b") }
    { "email": "frank.xorjas@gmail.com", "password": "123", "_id": ObjectId("547cc76dda8140151f27a2b9") }
    { "email": "manuel.rojas.21@gmail.com", "password": "123", "_id": ObjectId("547cc76d906814a139716182") }
    { "email": "rfiatt996@gmail.com", "password": "123", "_id": ObjectId("547cc76dc46f89d102dc84a3") }
  ]

  User.create users

  affiliates = [
    { "_id" : ObjectId("5476a00f5afcef905730e687"), "name" : "Taco Bell", "pointsPerDollar" : 0.2, "website" : "http://www.tacobell.com", "picture": "pics/taco_bell.jpg", "description" : "Ding dong ding dong. Arf arf!" }
    { "_id" : ObjectId("547cb05f3eed2d2eee762e95"), "name" : "Adidas", "pointsPerDollar" : 0.6, "website" : "http://www.adidas.com", "picture": "pics/adidas.jpg", "description" : "Sports store and more more more." }
    { "_id" : ObjectId("547cb05fbcefb3f592de9419"), "name" : "EPA", "pointsPerDollar" : 0.3, "website" : "http://www.epa.com", "picture": "pics/EPA.jpg", "description" : "Hardware store." }
    { "_id" : ObjectId("547cb05ffe5753a43a99d221"), "name" : "Hooters", "pointsPerDollar" : 0.25, "website" : "http://www.hooters.com", "picture": "pics/hooters.jpg", "description" : "You're gonna like it." }
  ]

  Affiliate.create affiliates, ->
    console.log 'Affiliates created!'.green
    created()

  rewards = [
    {"affiliate": affiliates[0]._id, "expires": new Date(1436821597156), "picture": "http://placehold.it/50x50", "description": "laborum sunt cupidatat cillum ipsum cillum ea occaecat labore deserunt", "value": 193, "name": "Ozean", "_id": ObjectId("547cb43b20e474a423fb0182")}
    {"affiliate": affiliates[0]._id, "expires": new Date(1426428328886), "picture": "http://placehold.it/50x50", "description": "sunt laboris amet eiusmod minim culpa labore non dolor sunt", "value": 234, "name": "Kage", "_id": ObjectId("547cb43b3db1ead349252ee5")}
    {"affiliate": affiliates[0]._id, "expires": new Date(1428968138401), "picture": "http://placehold.it/50x50", "description": "elit cupidatat labore adipisicing magna proident ut ullamco laborum et", "value": 47, "name": "Emoltra", "_id": ObjectId("547cb43b9b8e5d84058c96ef")}
    {"affiliate": affiliates[0]._id, "expires": new Date(1431346414363), "picture": "http://placehold.it/50x50", "description": "id laboris irure mollit elit do sit magna in labore", "value": 126, "name": "Roughies", "_id": ObjectId("547cb43bb3f88a227cb512ee")}
    {"affiliate": affiliates[0]._id, "expires": new Date(1436229608586), "picture": "http://placehold.it/50x50", "description": "nostrud cillum ex exercitation pariatur ad tempor excepteur eu est", "value": 17, "name": "Orboid", "_id": ObjectId("547cb43ba292584986d84ba7")}
    {"affiliate": affiliates[0]._id, "expires": new Date(1431793871833), "picture": "http://placehold.it/50x50", "description": "pariatur sunt sint eiusmod dolor in commodo esse officia id", "value": 217, "name": "Netagy", "_id": ObjectId("547cb43b3bf3195172c8b215")}

    {"affiliate": affiliates[1]._id, "expires": new Date(1431164859301), "picture": "http://placehold.it/50x50", "description": "eiusmod irure est non exercitation ipsum minim in sint do", "value": 15, "name": "Lunchpod", "_id": ObjectId("547cb43b509fe86f5ff61fd1")}
    {"affiliate": affiliates[1]._id, "expires": new Date(1440521875932), "picture": "http://placehold.it/50x50", "description": "ex Lorem magna reprehenderit ut ea dolor et dolore exercitation", "value": 168, "name": "Trollery", "_id": ObjectId("547cb43b6539b35413378a45")}
    {"affiliate": affiliates[1]._id, "expires": new Date(1434476971665), "picture": "http://placehold.it/50x50", "description": "velit laborum pariatur cillum incididunt incididunt officia officia aute velit", "value": 211, "name": "Keengen", "_id": ObjectId("547cb43bfb0f10b28b1ffc68")}
    {"affiliate": affiliates[1]._id, "expires": new Date(1426137165885), "picture": "http://placehold.it/50x50", "description": "velit do magna culpa sunt commodo dolore elit exercitation qui", "value": 233, "name": "Microluxe", "_id": ObjectId("547cb43b78c7c61a3823a227")}
    {"affiliate": affiliates[1]._id, "expires": new Date(1431067870994), "picture": "http://placehold.it/50x50", "description": "minim aliqua eu esse officia adipisicing laborum commodo do eu", "value": 217, "name": "Enquility", "_id": ObjectId("547cb43b9369819bc1f6122f")}

    {"affiliate": affiliates[2]._id, "expires": new Date(1423027921368), "picture": "http://placehold.it/50x50", "description": "cillum anim duis nisi deserunt sunt sint aliqua consectetur laborum", "value": 223, "name": "Uniworld", "_id": ObjectId("547cb43b76e1180ce465bb12")}
    {"affiliate": affiliates[2]._id, "expires": new Date(1427915486788), "picture": "http://placehold.it/50x50", "description": "cillum deserunt dolore adipisicing id mollit tempor laboris commodo anim", "value": 191, "name": "Fitcore", "_id": ObjectId("547cb43b8e7b6808df2b9e6d")}
    {"affiliate": affiliates[2]._id, "expires": new Date(1422401593972), "picture": "http://placehold.it/50x50", "description": "quis velit sint et tempor duis esse nulla ullamco consequat", "value": 84, "name": "Plasmos", "_id": ObjectId("547cb43ba63d987c5a514d81")}
    {"affiliate": affiliates[2]._id, "expires": new Date(1438824823012), "picture": "http://placehold.it/50x50", "description": "anim tempor laboris in mollit amet eu adipisicing officia pariatur", "value": 56, "name": "Rooforia", "_id": ObjectId("547cb43b6a85b5a203f459c9")}
    {"affiliate": affiliates[2]._id, "expires": new Date(1433530278028), "picture": "http://placehold.it/50x50", "description": "quis consequat deserunt commodo ex anim occaecat voluptate occaecat ad", "value": 85, "name": "Medcom", "_id": ObjectId("547cb43bb119bcd3c4e3fd6b")}
    {"affiliate": affiliates[2]._id, "expires": new Date(1429949085247), "picture": "http://placehold.it/50x50", "description": "duis ipsum ut Lorem aliqua veniam consectetur dolor sunt enim", "value": 54, "name": "Securia", "_id": ObjectId("547cb43b1041676b18462e37")}

    {"affiliate": affiliates[3]._id, "expires": new Date(1428447116993), "picture": "http://placehold.it/50x50", "description": "occaecat ipsum in velit consequat reprehenderit nisi voluptate sint sint", "value": 33, "name": "Comtract", "_id": ObjectId("547cb43b38c0313f1c1f8297")}
    {"affiliate": affiliates[3]._id, "expires": new Date(1426657584375), "picture": "http://placehold.it/50x50", "description": "ea incididunt aliquip adipisicing sit minim deserunt non elit aliquip", "value": 163, "name": "Elita", "_id": ObjectId("547cb43ba9171b84b8ae23c1")}
    {"affiliate": affiliates[3]._id, "expires": new Date(1429675681794), "picture": "http://placehold.it/50x50", "description": "sint irure do elit enim sit eu incididunt consequat amet", "value": 50, "name": "Ziggles", "_id": ObjectId("547cb43b98c88eb45775ae86")}
  ]

  Reward.create rewards, ->
    console.log 'Rewards created!'.green
    created()

  points = [
    {"affiliate": affiliates[0]._id, "amount": 37.77, "code": "CRPEDGAFIFFP", "_id": ObjectId("547cb91c371165d3616b7031")}
    {"affiliate": affiliates[0]._id, "amount": 25.24, "code": "CRPABIEFEDBP", "_id": ObjectId("547cb91c6987509c7a4f41fa")}
    {"affiliate": affiliates[0]._id, "amount": 15.76, "code": "CRPDICBHFAGP", "_id": ObjectId("547cb91cd14bba90db373a8e")}
    {"affiliate": affiliates[0]._id, "amount": 35.47, "code": "CRPAEEEBHICP", "_id": ObjectId("547cb91c5f04523caff5be37")}
    {"affiliate": affiliates[0]._id, "amount": 33.38, "code": "CRPCDBBGGBIP", "_id": ObjectId("547cb91c1993aab2d60ec33b")}
    {"affiliate": affiliates[0]._id, "amount": 19.91, "code": "CRPCEBEIHCIP", "_id": ObjectId("547cb91cf5b6d8fd6c07cca4")}
    {"affiliate": affiliates[0]._id, "amount": 1.9, "code": "CRPBBBHGCBEP", "_id": ObjectId("547cb91c17f571f966d2e78c")}
    {"affiliate": affiliates[0]._id, "amount": 47.6, "code": "CRPEIEEAEIIP", "_id": ObjectId("547cb91c3922c29e171bd2aa")}
    {"affiliate": affiliates[0]._id, "amount": 46.98, "code": "CRPGEICAEEGP", "_id": ObjectId("547cb91cabe66d8b275dda20")}
    {"affiliate": affiliates[0]._id, "amount": 21.49, "code": "CRPEGAHHEEBP", "_id": ObjectId("547cb91ca646d22043a8f070")}
    {"affiliate": affiliates[0]._id, "amount": 45.57, "code": "CRPCFBCFEFBP", "_id": ObjectId("547cb91cea9d1f5e521927ca")}
    {"affiliate": affiliates[0]._id, "amount": 29.6, "code": "CRPADEEIHEIP", "_id": ObjectId("547cb91c6794558c52bbbe5e")}

    {"affiliate": affiliates[1]._id, "amount": 45.3, "code": "CRPAGDCCDGAP", "_id": ObjectId("547cb91c7a06abc0dd19f6b3")}
    {"affiliate": affiliates[1]._id, "amount": 24.41, "code": "CRPAIHHDFAAP", "_id": ObjectId("547cb91cbbecf874af72f033")}
    {"affiliate": affiliates[1]._id, "amount": 16.02, "code": "CRPDFGBCABIP", "_id": ObjectId("547cb91ca2da93abb4bfa5b8")}
    {"affiliate": affiliates[1]._id, "amount": 27.64, "code": "CRPIFCIFEFBP", "_id": ObjectId("547cb91cf08ddd6cefaf6509")}
    {"affiliate": affiliates[1]._id, "amount": 13.49, "code": "CRPIIHGAGFAP", "_id": ObjectId("547cb91c58f923d384f46a69")}
    {"affiliate": affiliates[1]._id, "amount": 18.66, "code": "CRPAFAAHGHAP", "_id": ObjectId("547cb91c84a59865a44de9de")}
    {"affiliate": affiliates[1]._id, "amount": 18.48, "code": "CRPGBGBFFABP", "_id": ObjectId("547cb91c86e59b05a0af56be")}

    {"affiliate": affiliates[2]._id, "amount": 24.86, "code": "CRPFFEEICEIP", "_id": ObjectId("547cb91c0a687fcc890260d1")}
    {"affiliate": affiliates[2]._id, "amount": 3.39, "code": "CRPEEABFFFBP", "_id": ObjectId("547cb91ccfac68b2bdc55018")}
    {"affiliate": affiliates[2]._id, "amount": 49.88, "code": "CRPIADDHDDBP", "_id": ObjectId("547cb91ce5f6941a23babc15")}
    {"affiliate": affiliates[2]._id, "amount": 47.91, "code": "CRPABGDFCHFP", "_id": ObjectId("547cb91ca1674a0db4c608d1")}
    {"affiliate": affiliates[2]._id, "amount": 19.35, "code": "CRPCCADCCEIP", "_id": ObjectId("547cb91cf95337eb7dcfc5bb")}
    {"affiliate": affiliates[2]._id, "amount": 31.56, "code": "CRPGEHFIHCDP", "_id": ObjectId("547cb91c5482ba7992d23059")}

    {"affiliate": affiliates[3]._id, "amount": 25.44, "code": "CRPGAAAFDCHP", "_id": ObjectId("547cb91ca21f60fa8c24f41a")}
    {"affiliate": affiliates[3]._id, "amount": 14.7, "code": "CRPFFHEHIACP", "_id": ObjectId("547cb91c82a43738d13e25c1")}
    {"affiliate": affiliates[3]._id, "amount": 46.66, "code": "CRPHAFGEFFBP", "_id": ObjectId("547cb91c1220cd349bf19e0e")}
    {"affiliate": affiliates[3]._id, "amount": 45.39, "code": "CRPBHAGIDEAP", "_id": ObjectId("547cb91ca121bc77c347169e")}
    {"affiliate": affiliates[3]._id, "amount": 26.08, "code": "CRPHFFDHFIGP", "_id": ObjectId("547cb91c06329353103d0142")}
  ]

  Points.create points, ->
    console.log 'Points created!'.green
    created()

  receipts = [
    {"user": users[0]._id, "reward": rewards[3]._id, "code": "CRPDIAEAADDR", "_id": ObjectId("547cc61b44ab00bd30dc7f35")}
    {"user": users[0]._id, "reward": rewards[4]._id, "code": "CRPABAADIDIR", "_id": ObjectId("547cc61bc7dc2a5be44fc5b4")}
    {"user": users[1]._id, "reward": rewards[0]._id, "code": "CRPIAHCBECFR", "_id": ObjectId("547cc61bc79b192fed780f33")}
    {"user": users[1]._id, "reward": rewards[6]._id, "code": "CRPCECAIIEHR", "_id": ObjectId("547cc61bc77707476c4728eb")}
    {"user": users[2]._id, "reward": rewards[0]._id, "code": "CRPECAAIGEFR", "_id": ObjectId("547cc61bd0ef9c115429ba79")}
    {"user": users[2]._id, "reward": rewards[2]._id, "code": "CRPBGAGDAIGR", "_id": ObjectId("547cc61b94c8179d2a810d83")}
    {"user": users[3]._id, "reward": rewards[0]._id, "code": "CRPBBHFAIBFR", "_id": ObjectId("547cc61b96930c892cbdc4aa")}
    {"user": users[3]._id, "reward": rewards[9]._id, "code": "CRPDDECBBIBR", "_id": ObjectId("547cc61baa142ba79aedca68")}
  ]

  Receipt.create receipts, ->
    console.log 'Receipts created!'.green
    created()