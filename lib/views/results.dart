import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({Key? key}) : super(key: key);

  @override
  _ResultsScreenState createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference specs = db.collection("specs");
    DocumentReference lastTest = specs.doc("lastTest");
    Stream<DocumentSnapshot> stuff = lastTest.snapshots();

    return Scaffold(
      appBar: AppBar(title: const Text('Test Results'),),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 10),
            Column(
              children: [
                Card(
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () { debugPrint('Card tapped.'); },
                    child: SizedBox(
                      width: 350,
                      height: 100,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('pH: ', style: TextStyle(fontSize: 20)),
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
                                  var condition;
                                  if (data['pH'] < 5) {
                                    condition = 'Normal';
                                  } else if (data['pH'] < 8) {
                                    condition = 'Warning';
                                  } else if (data['pH'] < 10) {
                                    condition = 'Critical';
                                  }
                                  return Text('${data['pH']} ($condition)', style: const TextStyle(fontSize: 20));
                                },
                              )
                            ]
                          ),
                          const SizedBox(height: 5),
                          const Text('You should...'),
                          const SizedBox(height: 5),
                          const Text('If you would like, you can...'),
                        ],
                      ),
                    ),
                  )
                ),
                const SizedBox(height: 5),
                Card(
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () { debugPrint('Card tapped.'); },
                      child: SizedBox(
                        width: 350,
                        height: 100,
                        child: Column(
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('chlorine: ', style: TextStyle(fontSize: 20)),
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
                                      var condition;
                                      if (data['chlorine'] < 5) {
                                        condition = 'Normal';
                                      } else if (data['chlorine'] < 8) {
                                        condition = 'Warning';
                                      } else if (data['chlorine'] < 10) {
                                        condition = 'Critical';
                                      }
                                      return Text('${data['chlorine']} ($condition)', style: const TextStyle(fontSize: 20));
                                    },
                                  )
                                ]
                            ),
                            const SizedBox(height: 5),
                            const Text('You should...'),
                            const SizedBox(height: 5),
                            const Text('If you would like, you can...'),
                          ],
                        ),
                      ),
                    )
                ),
                const SizedBox(height: 5),
                Card(
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () { debugPrint('Card tapped.'); },
                      child: SizedBox(
                        width: 350,
                        height: 100,
                        child: Column(
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('ammonia: ', style: TextStyle(fontSize: 20)),
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
                                      var condition;
                                      if (data['ammonia'] < 5) {
                                        condition = 'Normal';
                                      } else if (data['ammonia'] < 8) {
                                        condition = 'Warning';
                                      } else if (data['ammonia'] < 10) {
                                        condition = 'Critical';
                                      }
                                      return Text('${data['ammonia']} ($condition)', style: const TextStyle(fontSize: 20));
                                    },
                                  )
                                ]
                            ),
                            const SizedBox(height: 5),
                            const Text('You should...'),
                            const SizedBox(height: 5),
                            const Text('If you would like, you can...'),
                          ],
                        ),
                      ),
                    )
                )
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}