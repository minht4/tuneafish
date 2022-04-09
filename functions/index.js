const functions = require("firebase-functions");
const admin = require('firebase-admin');

admin.initializeApp(functions.config().firebase);

exports.notifyTemp = functions.firestore.document('specs/temperature').onUpdate(async (event) => {
    const temp = event.after.get('temp');
    const pretemp = event.before.get('temp');


    let userDoc = await admin.firestore().doc(`UserTokens/Fcm-Token`).get();
    let fcmToken = userDoc.get('token');
    if((pretemp <= 83 && temp >= 83) || (pretemp >= 71 && temp <= 71)){
    var message = {
        notification: {
            title: "Temperature Fluctuation Emergency!",
            body: "Current tank temperature is at an extreme: "+temp+"F",

        },
        token: fcmToken,
    }

    let response = await admin.messaging().send(message);
    console.log(response);
    }
    else if((pretemp >= 77 && (temp >= 81 && temp < 83)) || (pretemp <= 77 && (temp <= 73 && temp > 71))){
        var message = {
            notification: {
                title: "Temperature Fluctuation",
                body: "Please adjust the tank temperature\nCurrent tank temperature: "+temp+"F",

            },
            token: fcmToken,
        }

        let response = await admin.messaging().send(message);
        console.log(response);
        }else return 0;
});

exports.notifyWaterLevel = functions.firestore.document('specs/waterLevel').onUpdate(async (event) => {
    const waterlvl = event.after.get('level');
    const prewaterlvl = event.before.get('level');

    let userDoc = await admin.firestore().doc(`UserTokens/Fcm-Token`).get();
    let fcmToken = userDoc.get('token');
    if(((prewaterlvl  >= 1) && (waterlvl <=  1))) {
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