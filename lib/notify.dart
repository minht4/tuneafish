import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import "package:firebase_messaging/firebase_messaging.dart";
import 'package:cloud_firestore/cloud_firestore.dart';

class Notify extends StatefulWidget {
  const Notify({Key? key}) : super(key: key);

  @override
  NotificationState createState() => NotificationState();
}

class NotificationState extends State<Notify> {
  String Msg = "";

  @override
  void initState() {
    super.initState();

    FirebaseMessaging.instance.getToken().then((token) {
      print(token);
      getToken();
    });

    FirebaseMessaging.instance.getInitialMessage().then((event) {
      if (event != null) {
        setState(() {
          Msg = "${event.notification!.title} ${event.notification!.body}";
        });
      }
    });
  }

  void saveToken(String? token) async {
    await FirebaseFirestore.instance
        .collection("UserTokens")
        .doc("Fcm-Token")
        .set({
      'token': token,
    });
  }

  void getToken() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      saveToken(token);
    });
  }

  void background() async {
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      setState(() {
        Msg = "${event.notification!.title} ${event.notification!.body}";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
