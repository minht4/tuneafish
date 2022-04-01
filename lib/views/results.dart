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
                        height: 80,
                        child: Column(
                          children: [
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
                                String condition = '';
                                if (data['nitrate'] <= 20) {
                                  condition = 'Normal';
                                } else if (data['nitrate'] <= 40) {
                                  condition = 'Warning';
                                } else if (data['nitrate'] > 40) {
                                  condition = 'Critical';
                                }
                                return Text('Nitrate: ${data['nitrate']} ($condition)', style: const TextStyle(fontSize: 20));
                              },
                            ),
                            const SizedBox(height: 5),
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
                                String advice = '';
                                if (data['nitrate'] <= 20) {
                                  advice = 'No action required';
                                } else if (data['nitrate'] <= 40) {
                                  advice = 'Consider changing water soon';
                                } else if (data['nitrate'] > 40) {
                                  advice = 'Please perform a water change\nCheck for irregularities if issue persists';
                                }
                                return Text(advice, style: const TextStyle(fontSize: 12), textAlign: TextAlign.center);
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                ), // nitrate
                const SizedBox(height: 5),
                Card(
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () { debugPrint('Card tapped.'); },
                      child: SizedBox(
                        width: 350,
                        height: 80,
                        child: Column(
                          children: [
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
                                String condition = '';
                                if (data['nitrite'] <= 0.5) {
                                  condition = 'Normal';
                                } else if (data['nitrite'] <= 1) {
                                  condition = 'Warning';
                                } else if (data['nitrite'] > 1) {
                                  condition = 'Critical';
                                }
                                return Text('Nitrite: ${data['nitrite']} ($condition)', style: const TextStyle(fontSize: 20));
                              },
                            ),
                            const SizedBox(height: 5),
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
                                String advice = '';
                                if (data['nitrite'] <= 0.5) {
                                  advice = 'No action required';
                                } else if (data['nitrite'] <= 1) {
                                  advice = 'Consider changing water soon';
                                } else if (data['nitrite'] > 1) {
                                  advice = 'Please perform a water change\nCheck the tank and fishes if issue persists';
                                }
                                return Text(advice, style: const TextStyle(fontSize: 12), textAlign: TextAlign.center);
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                ), // nitrite
                const SizedBox(height: 5),
                Card(
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () { debugPrint('Card tapped.'); },
                      child: SizedBox(
                        width: 350,
                        height: 80,
                        child: Column(
                          children: [
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
                                String condition = '';
                                if (data['hardness'] >= 50 && data['hardness'] <= 150) {
                                  condition = 'Normal';
                                } else {
                                  condition = 'Critical';
                                }
                                return Text('Hardness: ${data['hardness']} ($condition)', style: const TextStyle(fontSize: 20));
                              },
                            ),
                            const SizedBox(height: 5),
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
                                String advice = '';
                                if (data['hardness'] >= 50 && data['hardness'] <= 150) {
                                  advice = 'No action required';
                                } else {
                                  if (data['hardness'] <= 50) {
                                    advice = 'Please increase water hardness\nAdd limestone or crushed coral';
                                  } else {
                                    advice = 'Please decrease water hardness\nReduce the concentration of calcium and magnesium';
                                  }
                                }
                                return Text(advice, style: const TextStyle(fontSize: 12), textAlign: TextAlign.center);
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                ), // hardness
                const SizedBox(height: 5),
                Card(
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () { debugPrint('Card tapped.'); },
                      child: SizedBox(
                        width: 350,
                        height: 80,
                        child: Column(
                          children: [
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
                                String condition = '';
                                if (data['chlorine'] == 0) {
                                  condition = 'Normal';
                                } else {
                                  condition = 'Critical';
                                }
                                return Text('Chlorine: ${data['chlorine']} ($condition)', style: const TextStyle(fontSize: 20));
                              },
                            ),
                            const SizedBox(height: 5),
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
                                String advice = '';
                                if (data['chlorine'] == 0) {
                                  advice = 'No action required';
                                } else {
                                  advice = 'Please add dechlorinator';
                                }
                                return Text(advice, style: const TextStyle(fontSize: 12), textAlign: TextAlign.center);
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                ), // chlorine
                const SizedBox(height: 5),
                Card(
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () { debugPrint('Card tapped.'); },
                      child: SizedBox(
                        width: 350,
                        height: 80,
                        child: Column(
                          children: [
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
                                String condition = '';
                                if (data['alkalinity'] >= 100 && data['alkalinity'] <= 180) {
                                  condition = 'Normal';
                                } else {
                                  condition = 'Critical';
                                }
                                return Text('Alkalinity: ${data['alkalinity']} ($condition)', style: const TextStyle(fontSize: 20));
                              },
                            ),
                            const SizedBox(height: 5),
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
                                String advice = '';
                                if (data['alkalinity'] >= 100 && data['alkalinity'] <= 180) {
                                  advice = 'No action required';
                                } else {
                                  if (data['alkalinity'] < 100) {
                                    advice = 'Please increase the alkalinity water\nAdd limestone or crushed coral';
                                  } else {
                                    advice = 'Please decrease the alkalinity water\nReduce the concentration of calcium and magnesium';
                                  }
                                }
                                return Text(advice, style: const TextStyle(fontSize: 12), textAlign: TextAlign.center);
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                ), // alkalinity
                const SizedBox(height: 5),
                Card(
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () { debugPrint('Card tapped.'); },
                      child: SizedBox(
                        width: 350,
                        height: 80,
                        child: Column(
                          children: [
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
                                String condition = '';
                                if (data['pH'] >= 6.8 && data['pH'] <= 7.2) {
                                  condition = 'Normal';
                                } else {
                                  condition = 'Critical';
                                }
                                return Text('pH: ${data['pH']} ($condition)', style: const TextStyle(fontSize: 20));
                              },
                            ),
                            const SizedBox(height: 5),
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
                                String advice = '';
                                if (data['pH'] >= 6.8 && data['pH'] <= 7.2) {
                                  advice = 'No action required';
                                } else {
                                  if (data['pH'] < 6.8) {
                                    advice = 'Please increase the pH of the water\nAdd limestone or crushed coral';
                                  } else {
                                    advice = 'Please decrease the pH of the water\nReduce the concentration of calcium and magnesium';
                                  }
                                }
                                return Text(advice, style: const TextStyle(fontSize: 12), textAlign: TextAlign.center);
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                ), // pH
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}