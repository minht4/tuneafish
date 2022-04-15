import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxtest/views/clownFish.dart';

class DatabaseScreen extends StatefulWidget {
  const DatabaseScreen({Key? key}) : super(key: key);

  @override
  _DatabaseScreenState createState() => _DatabaseScreenState();
}

class _DatabaseScreenState extends State<DatabaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Text(
          'Database',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        Card(
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              Get.to(() => const ClownFish());
            },
            child: SizedBox(
              width: 350,
              height: 130,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Clown Fish"),
                  SizedBox(width: 30),
                  SizedBox(
                    width: 150,
                    height: 150,
                    child:
                      Image.network('https://www.americanoceans.org/wp-content/uploads/2021/10/clownfish.jpg'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
