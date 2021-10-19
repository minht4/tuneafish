import 'package:flutter/material.dart';

class SpecsScreen extends StatefulWidget {
  const SpecsScreen({Key? key}) : super(key: key);

  @override
  _SpecsScreenState createState() => _SpecsScreenState();
}

class _SpecsScreenState extends State<SpecsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Change Specifications')),
      body: Center(
        child: Column(
          children:  const <Widget>[
            SizedBox(height: 50),
            Text('Change tank size here'),
            SizedBox(height: 20),
            Text('Change # of fishes here'),
          ],
        ),
      ),
    );
  }
}