import 'package:get/get.dart';

class HomeController extends GetxController{
  var temperature = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTemp();
  }

  void fetchTemp() async {
    await Future.delayed(Duration(seconds: 5));
    var serverTemp = 40.6;
    temperature.value = serverTemp;
  }
}
