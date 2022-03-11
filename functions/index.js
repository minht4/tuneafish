const functions = require("firebase-functions");
const admin = require('firebase-admin');

admin.initializeApp(functions.config().firebase);

exports.notifyTemp = functions.firestore.document('specs/temperature').onUpdate(async (event) => {
    const temperature = event.after.get('temp');
   
    let userDoc = await admin.firestore().doc(`UserTokens/Fcm-Token`).get();
    let fcmToken = userDoc.get('token');
    if(temperature>40 || temperature<5){
    var message = {
        notification: {
            title: "Temperature fluctuation",
            body: "Current tank temperature is at an extreme: "+temperature,
        
        },
        token: fcmToken,
    }

    let response = await admin.messaging().send(message);
    console.log(response);
    }else return 0;
});

exports.notifyWaterLevel = functions.firestore.document('specs/waterLevel').onUpdate(async (event) => {
    const waterlvl = event.after.get('level');
   
    let userDoc = await admin.firestore().doc(`UserTokens/Fcm-Token`).get();
    let fcmToken = userDoc.get('token');
    if(waterlvl<=  10){
    var message = {
        notification: {
            title: "Tank Water Level fluctuation",
            body: "Current Water level is too low: "+waterlvl,
        
        },
        token: fcmToken,
    }

    let response = await admin.messaging().send(message);
    console.log(response);
    }else return 0;
});