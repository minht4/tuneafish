import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxtest/views/change_specs.dart';
import 'package:getxtest/globals.dart' as globals;
import 'change_specs.dart';

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
          'Settings',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        const SizedBox(height: 10),
        FloatingActionButton.extended(
            onPressed: () {
              Get.to(() => const SpecsScreen());
            },
            label: const Text('Change Tank Specifications')
        )
    ]
    );

  }
}
