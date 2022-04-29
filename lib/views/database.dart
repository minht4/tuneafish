import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxtest/views/clownFish.dart';
import 'package:getxtest/views/damselFish.dart';
import 'package:getxtest/views/greenChromis.dart';

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
        const SizedBox(height: 10),
        Card(
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              Get.to(() => const DamselFish());
            },
            child: SizedBox(
              width: 350,
              height: 130,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Damsel Fish"),
                  SizedBox(width: 30),
                  SizedBox(
                    width: 150,
                    height: 150,
                    child:
                    Image.network('https://www.tfhmagazine.com/-/media/Images/TFH2-NA/US/articles/494_damsels_in_my_aquarium.jpg'),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Card(
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              Get.to(() => const GreenChromis());
            },
            child: SizedBox(
              width: 350,
              height: 130,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Green Chromis"),
                  SizedBox(width: 30),
                  SizedBox(
                    width: 150,
                    height: 150,
                    child:
                    Image.network('https://upload.wikimedia.org/wikipedia/commons/f/f3/Chromis_viridis_2011.jpg'),
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
