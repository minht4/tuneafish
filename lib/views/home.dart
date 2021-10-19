import 'package:flutter/material.dart';
import 'package:getxtest/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    FirebaseDatabase database = FirebaseDatabase.instance;
    DatabaseReference myRef = database.reference();

    return Column(
      children: [
        const SizedBox(height: 20,),
        const Text(
          "Home",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        const SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.fromLTRB(32.0,0.0,0.0,0.0),
          child: Row(
            children: [
              const Text(
                "Temperature: ",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                '${homeController.temperature.value}',
                style: const TextStyle(
                    fontSize: 20
                ),
              ),
              TextButton(onPressed: (){
                myRef.child('Hello').push().child('button').set('pressed').asStream();
              }, child: Text('button',),
              )
            ],
          ),
        ),
      ],
    );
  }
}

