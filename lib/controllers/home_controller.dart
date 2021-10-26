import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class HomeController extends GetxController{
  var temperature = "0.0".obs;
  DocumentReference temp = FirebaseFirestore.instance.collection("specs").doc("temperature");

  @override
  void onInit() {
    super.onInit();

    fetchTemp();
  }

  void fetchTemp() async {
    var serverTemp = await temp.get().then((value) => value['temp'].toString());
    temperature.value = serverTemp;
  }

}
