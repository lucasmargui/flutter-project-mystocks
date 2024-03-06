const functions = require("firebase-functions");
const admin = require("firebase-admin");
const request = require("graphql-request");

const client = new request.GraphQLClient('https://integracao-exemplo.hasura.app/v1/graphql', {
    headers: {
        "content-type": "application/json",
        "x-hasura-admin-secret": "QCBtj9Ve8vzegzBkAYSLxB2wf0kREPPGEiT9xseh8GFtW6wSLLIa3PAtevf4gfzU" 
    }
})
admin.initializeApp(functions.config().firebase);


exports.registerUser = functions.https.onCall(async (data, context) => {


    const email = data.email;
    const password = data.password;
    const displayName = data.displayName;

    if (email == null || password == null || displayName == null) {
        throw new functions.https.HttpsError('signup-failed', 'missing information');
    }

    try {
        var userRecord = await admin.auth().createUser({
            email: email,
            password: password,
            displayName: displayName
        });
        // exatamente oq passaremos no cabeçalho depois de interceptar o cabeçalho
        const customClaims = {
            "https://hasura.io/jwt/claims": {
                "x-hasura-default-role": "user",
                "x-hasura-allowed-roles": ["user"],
                "x-hasura-user-id": userRecord.uid
            }
        };

        await admin.auth().setCustomUserClaims(userRecord.uid, customClaims);
        return userRecord.toJSON();

    } catch (e) {
        throw new functions.https.HttpsError('signup-failed', JSON.stringify(error, undefined, 2));
    }
});

// SYNC WITH HASURA ON USER CREATE
exports.processSignUp = functions.auth.user().onCreate(async user => {

    const id = user.uid;
    const email = user.email;
    const name = user.displayName || "No Name";

    const mutation = `mutation($id: String!, $email: String, $name: String) {
    insert_user(objects: [{
        id: $id,
        email: $email,
        name: $name,
      }]) {
        affected_rows
      }
    }`;
    try {
        const data = await client.request(mutation, {
            id: id,
            email: email,
            name: name
        })

        return data;
    } catch (e) {
        throw new functions.https.HttpsError('sync-failed');
    }
});

// SYNC WITH HASURA ON USER DELETE
exports.processDelete = functions.auth.user().onDelete(async (user) => {
    const mutation = `mutation($id: String!) {
        delete_users(where: {id: {_eq: $id}}) {
          affected_rows
        }
    }`;
    const id = user.uid;
    try {
        const data = await client.request(mutation, {
            id: id,
        })
        return data;
    } catch (e) {
        throw new functions.https.HttpsError('sync-failed');

    }
});


