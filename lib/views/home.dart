import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:getxtest/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getxtest/notify.dart';
import 'package:getxtest/globals.dart' as globals;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference specs = db.collection("specs");
    DocumentReference temp = specs.doc("temperature");
    DocumentReference wl = specs.doc("waterLevel");
    Stream<DocumentSnapshot> stuff = temp.snapshots();
    Stream<DocumentSnapshot> waterLevel = wl.snapshots();
    NotificationState().background();
    NotificationState().initState();
    final homeController = Get.put(HomeController());

    addData() async {
      Map<String, dynamic> data1 = {"level": "bad"};
      specs
          .doc("waterLevel")
          .set(data1)
          .whenComplete(() => print("works"))
          .onError((error, stackTrace) => print("not work"));
    }

    readData() async {
      var documentsnapshot = await specs.doc("waterLevel").get();
      if (documentsnapshot.exists) {
        Map<String, dynamic>? data =
            documentsnapshot.data() as Map<String, dynamic>?;
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
          padding: const EdgeInsets.fromLTRB(32.0, 0.0, 0.0, 0.0),
          child: Row(
            children: [
              const Text(
                "Temperature: ",
                style: TextStyle(fontSize: 20),
              ),
              StreamBuilder(
                stream: stuff,
                builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text('Loading...');
                  }
                  final data = snapshot.requireData;
                  Color color;
                  if (data['temp'] < 71 || data['temp'] > 85) {
                    color = Colors.red;
                  }
                  else if ((data['temp'] >= 71 && data['temp'] < 74) || (data['temp'] > 81 && data['temp'] <= 85)) {
                    color = Colors.orange;
                  }
                  else {
                    color = Colors.green;
                  }
                  // if (data['temp'] < 71.0 || data['temp'] > 85.0) {
                  //   color = Colors.red;
                  // }
                  // if ((data['temp'] >= 71.0 && data['temp'] <= 73.0) || (data['temp'] >= 82.0 && data['temp'] <= 85.0)) {
                  //   color = Colors.orange;
                  // }
                  // else {
                  //   color = Colors.purple;
                  //   print(data['temp']);
                  // }
                  return (SwitchScreen(temp: data['temp'].toDouble(), condition: color,));
                  // return Text(
                  //   '${data['temp']}',
                  //   style: TextStyle(fontSize: 20, color: color),
                  // );
                },
              ),
              const SizedBox(width: 20,),
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
              StreamBuilder(
                stream: waterLevel,
                builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text ('Something went wrong');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text('Loading...');
                  }
                  final data = snapshot.requireData;
                  String detail = "";
                  Color color;
                  if (data['level'] == 1) {
                    detail = 'Water level too low';
                    color = Colors.red;
                  }
                  else {
                    detail = 'Water level is optimal';
                    color = Colors.green;
                  }
                  return Text(detail,
                    style: TextStyle(fontSize: 20, color:color),);
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.fromLTRB(32.0,0.0,0.0,0.0),
          child: Row(
            children: [
              Text(
                "Tank Volume (Gallon): ${globals.size}",
                style: const TextStyle(
                  fontSize: 20
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.fromLTRB(32.0,0.0,0.0,0.0),
          child: Row(
            children: [
              Text(
                "Number of Fish: ${globals.fishes}",
                style: const TextStyle(
                    fontSize: 20
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SwitchScreen extends StatefulWidget {
  final double temp;
  final Color condition;
  const SwitchScreen({Key? key, required this.temp, required this.condition}) : super(key: key);
  //const SwitchScreen({Key? key}) : super(key: key);

  @override
 _SwitchScreenState createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {

  void toggleSwitch(bool value) {

    if(globals.isSwitched == false)
    {
      setState(() {
        globals.isSwitched = true;
        globals.textValue = '°F';
      });
    }
    else
    {
      setState(() {
        globals.isSwitched = false;
        globals.textValue = '°C';
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          globals.isSwitched ? Text('${(widget.temp).toStringAsFixed(2)}', style: TextStyle(fontSize: 20, color: widget.condition),) :
            Text('${((widget.temp-32)*(5/9)).toStringAsFixed(2)}', style: TextStyle(fontSize: 20, color: widget.condition),),
          SizedBox(width: 5),
          Text(globals.textValue, style: TextStyle(fontSize: 20, color: widget.condition),),
          SizedBox(width: 20),
          Switch(
            onChanged: toggleSwitch,
            value: globals.isSwitched,
            activeColor: Colors.white,
            activeTrackColor: Colors.greenAccent,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.deepOrange,
          ),
      ]);  ;
  }
}

