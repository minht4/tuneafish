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
    // var now = DateTime.now();
    // var date = 'April 15, 2022';

    return Column(
      children: [
        SizedBox(height: 20),
        const Text(
          'Schedule',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        const SizedBox( height: 10 ),
        Card(
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                var now = DateTime.now().toLocal();
                var date = '';
                switch (now.month) {
                  case 1:
                    date = 'January';
                    break;
                  case 2:
                    date = 'February';
                    break;
                  case 3:
                    date = 'March';
                    break;
                  case 4:
                    date = 'April';
                    break;
                  case 5:
                    date = 'May';
                    break;
                  case 6:
                    date = 'June';
                    break;
                  case 7:
                    date = 'July';
                    break;
                  case 8:
                    date = 'August';
                    break;
                  case 9:
                    date = 'September';
                    break;
                  case 10:
                    date = 'October';
                    break;
                  case 11:
                    date = 'November';
                    break;
                  case 12:
                    date = 'December';
                    break;
                }
                date += ' ${now.day}, ${now.year}';
                lastTest.update({ 'date':date });

                now = now.add(const Duration(days: 14));
                switch (now.month) {
                  case 1:
                    date = 'January';
                    break;
                  case 2:
                    date = 'February';
                    break;
                  case 3:
                    date = 'March';
                    break;
                  case 4:
                    date = 'April';
                    break;
                  case 5:
                    date = 'May';
                    break;
                  case 6:
                    date = 'June';
                    break;
                  case 7:
                    date = 'July';
                    break;
                  case 8:
                    date = 'August';
                    break;
                  case 9:
                    date = 'September';
                    break;
                  case 10:
                    date = 'October';
                    break;
                  case 11:
                    date = 'November';
                    break;
                  case 12:
                    date = 'December';
                    break;
                }
                date += ' ${now.day}, ${now.year}';
                lastTest.update({ 'next':date });
              },
              child: SizedBox(
                width: 350,
                height: 130,
                child: Column(
                    children: [
                      const SizedBox(height: 10),
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
                          return Text('Last Test:\n${data['date']}', textAlign: TextAlign.center,);
                        },
                      ),
                      const SizedBox(height: 10),
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
                          return Text('Next Test:\n${data['next']}', textAlign: TextAlign.center,);
                        },
                      ),
                      const SizedBox(height: 10),
                      const Text('Tap this card after water test')
                    ]
                ),
              ),
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