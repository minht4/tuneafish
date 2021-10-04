import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int temp = 0;

  void temperature(int n) {
    setState(() {
      temp = n;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 10),
        const Text(
          "Dashboarda",
          style: TextStyle(
            fontSize: 30,

          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(32.0,0.0,0.0,0.0),
          child: Row(
            children: [
              const Text(
                "Temperature: ",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              TextButton(
                onPressed: () {temperature(++temp);},
                child: Text("${temp}", style: TextStyle(fontSize: 20),),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

