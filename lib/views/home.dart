import 'package:flutter/material.dart';
import 'package:getxtest/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference specs = db.collection("specs");
    DocumentReference temp = specs.doc("temperature");
    Stream<DocumentSnapshot> stuff = temp.snapshots();
    final homeController = Get.put(HomeController());

    addData() async{
      Map<String, dynamic> data1 = {"level" : "bad"};
      specs.doc("waterLevel").set(data1).whenComplete(() => print("works")).onError((error, stackTrace) => print("not work"));
    }
    readData() async {
      var documentsnapshot = await specs.doc("waterLevel").get();
      if (documentsnapshot.exists) {
        Map<String, dynamic>? data = documentsnapshot.data() as Map<String, dynamic>?;
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
          padding: const EdgeInsets.fromLTRB(32.0,0.0,0.0,0.0),
          child: Row(
            children: [
              const Text(
                "Temperature: ",
                style: TextStyle(
                  fontSize: 20
                ),
              ),
              Text(
                '${homeController.temperature.value}',
                style: const TextStyle(
                    fontSize: 20
                ),
              ),
              TextButton(onPressed: (){
                myRef.child('Temp').push().child('Temp').set('Received').asStream();
              }, child: Text('Upload temp'),
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
              Text(
                '#%',
                style: const TextStyle(
                    fontSize: 20
                ),
              ),
              StreamBuilder(
                stream: stuff,
                builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text ('Something went wrong');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text('Loading...');
                  }
                  final data = snapshot.requireData;
                  return Text('${data['temp']}', style: const TextStyle(fontSize: 20),);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

}

