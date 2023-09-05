import 'package:get/get.dart';

class CounterController extends GetxController {
  int count = 0;

  void increament() {
    count++;
    update();
  }

  void decreament() {
    if (count > 0) {
      count--;
    }
    update();
  }
}
