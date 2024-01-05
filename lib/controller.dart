import 'package:get/get.dart';

class Controller extends GetxController {
  RxInt counter = 0.obs;
  incrementCounter() {
    counter.value = counter.value + 1;
  }
}
