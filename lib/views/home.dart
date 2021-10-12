import 'package:flutter/material.dart';
import 'package:getxtest/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());

    return Column(
      children: [
        const SizedBox(height: 20,),
        const Text("Home"),
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
              Text('${homeController.temperature.value}', style: TextStyle(fontSize: 20),),
            ],
          ),
        ),
      ],
    );
  }
}

