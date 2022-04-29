import 'package:flutter/material.dart';
import 'package:getxtest/globals.dart' as globals;

class GreenChromis extends StatefulWidget {
  const GreenChromis({Key? key}) : super(key: key);

  @override
  State<GreenChromis> createState() => _GreenChromisState();
}

class _GreenChromisState extends State<GreenChromis> {
  final TextEditingController _sizeController = TextEditingController(text: "${globals.size}");
  final TextEditingController _fishController = TextEditingController(text: "${globals.fishes}");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Green Chromis'),),
        body: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16,20,16,20),
              child: Column(
                children:  <Widget>[
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.network('https://upload.wikimedia.org/wikipedia/commons/f/f3/Chromis_viridis_2011.jpg'),
                  ),
                  Text("Size: Small", style: TextStyle(fontSize: 25),),
                  SizedBox(height: 20),
                  Text("Min Tank Size (Gal): 30", style: TextStyle(fontSize: 25),),
                  SizedBox(height: 20),
                  Text("Min GPH: 210", style: TextStyle(fontSize: 25),),
                  SizedBox(height: 20),
                  Text("Bio Load: Medium", style: TextStyle(fontSize: 25),),
                  SizedBox(height: 20),
                  Text("Temperature range: 75-78", style: TextStyle(fontSize: 25),),
                  SizedBox(height: 20),
                  Text("Alkalinity (dKH): 7-11", style: TextStyle(fontSize: 25),),
                  SizedBox(height: 20),
                  Text("pH: 7.8-8.5", style: TextStyle(fontSize: 25),),
                  SizedBox(height: 20),
                  Text("Max Nitrate (ppm): <5ppm", style: TextStyle(fontSize: 25),),
                  SizedBox(height: 20),
                ],
              ),
            )
        )
    );
  }
}
