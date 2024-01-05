import 'package:get/get.dart';

class MyGetController extends GetxController {
  RxInt counter = 0.obs;
  incrementCounter() {
    counter.value = counter.value + 1;
  }
}
