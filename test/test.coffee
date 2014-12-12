should = require 'should'
Assertion = should.Assertion
request = require 'supertest'
mongoose = require 'mongoose'
{app} = require '../src/server'
config = require "../src/config/test"

describe 'Test framework', ->
  it 'should have mocha installed and running.', ->
    true.should.equal true

describe 'Test API', ->
  # Set up the request to use our app
  request = request app
  before (done) ->
    mongoose.connect config.mongo.db
    done()

  # TODO: Complete the tests :)
  describe 'Client', ->
    it 'should return the list of clients', (done) ->
      request
        .get '/clients'
        .expect 200
        .end (err, res) ->
          if err then return done(err)
          res.body.should.be.an.instanceOf(Array)
          res.body.length.should.be.above(0)

          # Evaluates that the structure is the one expected
          Assertion.add 'client', ->
            @params = operator: 'to be client'

            @obj.should.have.property('name').which.is.a.String
            @obj.should.have.property('secret').which.is.a.String
            @obj.should.have.property('trusted').which.is.a.Boolean

          # Makes sure every element is of type client
          res.body.should.matchEach (it) -> it.should.be.a.client()
          done()
