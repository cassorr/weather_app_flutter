const functions = require("firebase-functions");
const admin = require("firebase-admin");

admin.initializeApp();
const db = admin.firestore();
const labRef = db.collection('lab').doc('test');

// Lab 5: Testing readLab function for lab/test document
exports.readLab = functions.https.onRequest((req, res) => {
    res.set("Access-Control-Allow-Origin", "*");
    console.log("Fetching lab/test from Firestore");
    labRef.get()
        .then((doc) => {
            if (doc.exists) {
                res.send(doc.data());
            } else {
                console.log("No such Document!");
                res.status(404).send("Document not found");
            }
        })
        .catch((error) => {
            console.error("Error fetching document", error);
            res.status(500).send("Internal Server Error");
        });
});
