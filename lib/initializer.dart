import 'package:get/get.dart';
import 'package:logger/logger.dart';

class Initializer {
  Future<void> init() async {
    await _initializer();
  }

  Future<void> _initializer() async {
    final connect = GetConnect();
    try {
      connect.baseUrl = 'https://jsonplaceholder.typicode.com/';
      Get.put(connect);
      Logger().d(connect.baseUrl);
    } catch (e) {
      Logger().d(e.toString());
    }
  }
}
