import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxtest/views/specs.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          const SizedBox(height: 20),
          const Text(
            "Settings",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          const SizedBox(height: 20),
          FloatingActionButton.extended(
              onPressed: () {
                Get.to(SpecsScreen());
              },
              label: const Text('Change Tank Specifications')
          )
        ]
    );
  }
}
