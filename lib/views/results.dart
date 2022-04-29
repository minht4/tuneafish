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
    Stream<DocumentSnapshot> nitrate = specs.doc("Nitrate").snapshots();
    Stream<DocumentSnapshot> nitrite = specs.doc("Nitrite").snapshots();
    Stream<DocumentSnapshot> hardness = specs.doc("Hardness").snapshots();
    Stream<DocumentSnapshot> chlorine = specs.doc("Chlorine").snapshots();
    Stream<DocumentSnapshot> alkalinity = specs.doc("Alkalinity").snapshots();
    Stream<DocumentSnapshot> pH = specs.doc("pH").snapshots();

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
                              stream: nitrate,
                              builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                                if (snapshot.hasError) {
                                  return const Text ('Something went wrong');
                                }
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return const Text('Loading...');
                                }
                                final data = snapshot.requireData;
                                String condition = '';
                                if (data['Nitrate'] <= 20) {
                                  condition = 'Normal';
                                } else if (data['Nitrate'] <= 40) {
                                  condition = 'Warning';
                                } else if (data['Nitrate'] > 40) {
                                  condition = 'Critical';
                                }
                                return Text('Nitrate: ${data['Nitrate']} ($condition)', style: const TextStyle(fontSize: 20));
                              },
                            ),
                            const SizedBox(height: 5),
                            StreamBuilder(
                              stream: nitrate,
                              builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                                if (snapshot.hasError) {
                                  return const Text ('Something went wrong');
                                }
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return const Text('Loading...');
                                }
                                final data = snapshot.requireData;
                                String advice = '';
                                if (data['Nitrate'] <= 20) {
                                  advice = 'No action required';
                                } else if (data['Nitrate'] <= 40) {
                                  advice = 'Consider changing water soon';
                                } else if (data['Nitrate'] > 40) {
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
                              stream: nitrite,
                              builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                                if (snapshot.hasError) {
                                  return const Text ('Something went wrong');
                                }
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return const Text('Loading...');
                                }
                                final data = snapshot.requireData;
                                String condition = '';
                                if (data['Nitrite'] <= 0.5) {
                                  condition = 'Normal';
                                } else if (data['Nitrite'] <= 1) {
                                  condition = 'Warning';
                                } else if (data['Nitrite'] > 1) {
                                  condition = 'Critical';
                                }
                                return Text('Nitrite: ${data['Nitrite']} ($condition)', style: const TextStyle(fontSize: 20));
                              },
                            ),
                            const SizedBox(height: 5),
                            StreamBuilder(
                              stream: nitrite,
                              builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                                if (snapshot.hasError) {
                                  return const Text ('Something went wrong');
                                }
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return const Text('Loading...');
                                }
                                final data = snapshot.requireData;
                                String advice = '';
                                if (data['Nitrite'] <= 0.5) {
                                  advice = 'No action required';
                                } else if (data['Nitrite'] <= 1) {
                                  advice = 'Consider changing water soon';
                                } else if (data['Nitrite'] > 1) {
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
                              stream: hardness,
                              builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                                if (snapshot.hasError) {
                                  return const Text ('Something went wrong');
                                }
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return const Text('Loading...');
                                }
                                final data = snapshot.requireData;
                                String condition = '';
                                if (data['Hardness'] >= 50 && data['Hardness'] <= 150) {
                                  condition = 'Normal';
                                } else {
                                  condition = 'Critical';
                                }
                                return Text('Hardness: ${data['Hardness']} ($condition)', style: const TextStyle(fontSize: 20));
                              },
                            ),
                            const SizedBox(height: 5),
                            StreamBuilder(
                              stream: hardness,
                              builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                                if (snapshot.hasError) {
                                  return const Text ('Something went wrong');
                                }
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return const Text('Loading...');
                                }
                                final data = snapshot.requireData;
                                String advice = '';
                                if (data['Hardness'] >= 50 && data['Hardness'] <= 150) {
                                  advice = 'No action required';
                                } else {
                                  if (data['Hardness'] <= 50) {
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
                              stream: chlorine,
                              builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                                if (snapshot.hasError) {
                                  return const Text ('Something went wrong');
                                }
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return const Text('Loading...');
                                }
                                final data = snapshot.requireData;
                                String condition = '';
                                if (data['Chlorine'] == 0) {
                                  condition = 'Normal';
                                } else {
                                  condition = 'Critical';
                                }
                                return Text('Chlorine: ${data['Chlorine']} ($condition)', style: const TextStyle(fontSize: 20));
                              },
                            ),
                            const SizedBox(height: 5),
                            StreamBuilder(
                              stream: chlorine,
                              builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                                if (snapshot.hasError) {
                                  return const Text ('Something went wrong');
                                }
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return const Text('Loading...');
                                }
                                final data = snapshot.requireData;
                                String advice = '';
                                if (data['Chlorine'] == 0) {
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
                              stream: alkalinity,
                              builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                                if (snapshot.hasError) {
                                  return const Text ('Something went wrong');
                                }
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return const Text('Loading...');
                                }
                                final data = snapshot.requireData;
                                String condition = '';
                                if (data['Alkalinity'] >= 100 && data['Alkalinity'] <= 180) {
                                  condition = 'Normal';
                                } else {
                                  condition = 'Critical';
                                }
                                return Text('Alkalinity: ${data['Alkalinity']} ($condition)', style: const TextStyle(fontSize: 20));
                              },
                            ),
                            const SizedBox(height: 5),
                            StreamBuilder(
                              stream: alkalinity,
                              builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                                if (snapshot.hasError) {
                                  return const Text ('Something went wrong');
                                }
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return const Text('Loading...');
                                }
                                final data = snapshot.requireData;
                                String advice = '';
                                if (data['Alkalinity'] >= 100 && data['Alkalinity'] <= 180) {
                                  advice = 'No action required';
                                } else {
                                  if (data['Alkalinity'] < 100) {
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
                              stream: pH,
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
                              stream: pH,
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