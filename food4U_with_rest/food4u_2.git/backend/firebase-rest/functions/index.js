// Author: Jumail 
// Email: jumail@utm.my
// Github:  github.com/jumail-utm
// Update: 4 Jun 2021

'use strict'

//const admin = require('./api/models/firebase/firebase_admin')
const functions = require("firebase-functions")
const express = require("express")
const app = express();
const usersRouter = require('./api/controllers/users_controller')
const countersRouter = require('./api/controllers/counters_controller')
const foodsRouter = require('./api/controllers/foods_controller')

app.use(express.json())
app.use('/users', usersRouter)
app.use('/counters', countersRouter)
app.use('/foods' , foodsRouter)



// To handle "Function Timeout" exception
exports.functionsTimeOut = functions.runWith({
    timeoutSeconds: 300
})

exports.setupdb = functions.https.onRequest(require('./tools/setup_database'))
exports.setupauth = functions.https.onRequest(require('./tools/setup_authentications'))
exports.api = functions.https.onRequest(app)
