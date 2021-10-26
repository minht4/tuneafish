import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxtest/views/change_specs.dart';

import 'change_specs.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int tankSize = 10;
  int numFish = 2;

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
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.fromLTRB(32,0,0,0),
          child: Row(
            children: <Widget>[
              Text(
                'Tank Size: $tankSize',
                style: const TextStyle(
                  fontSize: 20
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.fromLTRB(32,0,0,0),
          child: Row(
            children: <Widget>[
              Text(
                'Number of Fish: $numFish',
                style: const TextStyle(
                    fontSize: 20
                ),
              )
            ],
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
