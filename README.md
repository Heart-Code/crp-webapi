[ ![Codeship Status for Heart-Code/crp-webapi](https://codeship.com/projects/1c59d070-532c-0132-5f14-4e2e0d6a7c65/status)](https://codeship.com/projects/48884)

# CRP Web API
CRP Network Web API, it'll provide all the core functionality required for customers, affiliates and administrators to use.

## Run API
Do `npm install` and then `npm start` and you'll get the service running on your localhost at port 3000. Soon we'll add a configuration file to add some customization, specially changing the port.

## Tests
Run `npm test` to run the unit tests for the API.

## Mock up data
In order to have mock up data run `npm run init_db`, this will initialize the DB with data for testing purposes. You must have a MongoDB server running in order for this to work.