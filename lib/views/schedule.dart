import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getxtest/views/results.dart';
import 'package:get/get.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference specs = db.collection("specs");
    DocumentReference lastTest = specs.doc("lastTest");
    Stream<DocumentSnapshot> stuff = lastTest.snapshots();
    var date = 'asdf';

    return Column(
      children: [
        const SizedBox( height: 10 ),
        Card(
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () { debugPrint('Card tapped.'); },
            child: SizedBox(
              width: 350,
              height: 100,
              child: Row(
                children: [
                  Text('Last test: '),
                  StreamBuilder(
                    stream: stuff,
                    builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return const Text ('Something went wrong');
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Text('Loading...');
                      }
                      final data = snapshot.requireData;
                      return Text('${data['date']}');
                    },
                  )
                ]
              ),
            ),
          )
        ),
        const SizedBox( height: 10 ),
        Card(
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              lastTest.update({ 'date':date });

              },
            child: SizedBox(
              width: 350,
              height: 100,
              child: Row(
                children: [
                  Text('Next test: $date'),
                ],
              )
            )
          )
        ),
        const SizedBox( height: 10),
        FloatingActionButton.extended(
          onPressed: () {
            Get.to(() => const ResultsScreen());
          },
          label: const Text('Test Results'))
      ],
    );
  }
}
