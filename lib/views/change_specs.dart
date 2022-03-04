import 'package:flutter/material.dart';
import 'package:getxtest/globals.dart' as globals;

class SpecsScreen extends StatefulWidget {
  const SpecsScreen({Key? key}) : super(key: key);

  @override
  _SpecsScreenState createState() => _SpecsScreenState();
}

class _SpecsScreenState extends State<SpecsScreen> {
  final TextEditingController _sizeController = TextEditingController(text: "${globals.size}");
  final TextEditingController _fishController = TextEditingController(text: "${globals.fishes}");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Change Specs'),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16,40,16,40),
          child: Column(
            children:  <Widget>[
              TextField(
                controller: _sizeController,
                decoration: const InputDecoration(
                  labelText: "Tank Size",
                  labelStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder()
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _fishController,
                decoration: const InputDecoration(
                    labelText: "Number of Fishes",
                    labelStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder()
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: (){
                //_sizeController.text = globals.size.toString();
                print("size: ${_sizeController.text}");
                globals.size = int.parse(_sizeController.text);
                globals.fishes = int.parse(_fishController.text);
              }, child: const Text("Save"),),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}