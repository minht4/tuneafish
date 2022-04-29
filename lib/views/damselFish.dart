import 'package:flutter/material.dart';
import 'package:getxtest/globals.dart' as globals;

class DamselFish extends StatefulWidget {
  const DamselFish({Key? key}) : super(key: key);

  @override
  State<DamselFish> createState() => _DamselFishState();
}

class _DamselFishState extends State<DamselFish> {
  final TextEditingController _sizeController = TextEditingController(text: "${globals.size}");
  final TextEditingController _fishController = TextEditingController(text: "${globals.fishes}");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Damsel Fish'),),
        body: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16,20,16,20),
              child: Column(
                children:  <Widget>[
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.network('https://www.tfhmagazine.com/-/media/Images/TFH2-NA/US/articles/494_damsels_in_my_aquarium.jpg'),
                  ),
                  Text("Size: Medium", style: TextStyle(fontSize: 25),),
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
