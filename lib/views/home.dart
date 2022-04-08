import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:getxtest/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getxtest/notify.dart';
import 'package:getxtest/globals.dart' as globals;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference specs = db.collection("specs");
    DocumentReference temp = specs.doc("temperature");
    DocumentReference wl = specs.doc("waterLevel");
    Stream<DocumentSnapshot> stuff = temp.snapshots();
    NotificationState().background();
    NotificationState().initState();
    Stream<DocumentSnapshot> waterLevel = wl.snapshots();
    final homeController = Get.put(HomeController());

    addData() async {
      Map<String, dynamic> data1 = {"level": "bad"};
      specs
          .doc("waterLevel")
          .set(data1)
          .whenComplete(() => print("works"))
          .onError((error, stackTrace) => print("not work"));
    }

    readData() async {
      var documentsnapshot = await specs.doc("waterLevel").get();
      if (documentsnapshot.exists) {
        Map<String, dynamic>? data =
            documentsnapshot.data() as Map<String, dynamic>?;
      }
    }

    return Column(
      children: [
        const SizedBox(height: 20),
        const Text(
          "Home",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.fromLTRB(32.0, 0.0, 0.0, 0.0),
          child: Row(
            children: [
              const Text(
                "Temperature: ",
                style: TextStyle(fontSize: 20),
              ),
              StreamBuilder(
                stream: stuff,
                builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text('Loading...');
                  }
                  final data = snapshot.requireData;
                  return Text(
                    '${data['temp']}',
                    style: const TextStyle(fontSize: 20),
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.fromLTRB(32.0,0.0,0.0,0.0),
          child: Row(
            children: [
              const Text(
                "Water Level: ",
                style: TextStyle(
                    fontSize: 20
                ),
              ),
              StreamBuilder(
                stream: waterLevel,
                builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text ('Something went wrong');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text('Loading...');
                  }
                  final data = snapshot.requireData;
                  return Text('${data['level']}', style: const TextStyle(fontSize: 20),);
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.fromLTRB(32.0,0.0,0.0,0.0),
          child: Row(
            children: [
              Text(
                "Tank Size: ${globals.size}",
                style: const TextStyle(
                  fontSize: 20
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.fromLTRB(32.0,0.0,0.0,0.0),
          child: Row(
            children: [
              Text(
                "Number of Fishes: ${globals.fishes}",
                style: const TextStyle(
                    fontSize: 20
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
