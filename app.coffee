mongoose = require 'mongoose'
{start} = require './src/server'
env = process.env.NODE_ENV || 'development'
config = require "./src/config/#{env}"
{argv} = require 'yargs'

# Connect to mongoose
db = mongoose.connect config.mongo.db

# TODO: Change settings depending on environment

# Start server
port = argv.p || argv.port || config.port
start port