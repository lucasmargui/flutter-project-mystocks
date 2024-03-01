const functions = require("firebase-functions");
const admin = require("firebase-admin");
const request = require("graphql-request");

const client = new request.GraphQLClient('', {
    headers: {
        "content-type": "application/json",
        "x-hasura-admin-secret": "" 
    }
})
