import 'package:get/get.dart';

class HomeNavbarController extends GetxController {
  final _selectedView = 0.obs;
  int get selectedView => _selectedView.value;

  void changeSelectedView(int val) => _selectedView.value = val;
}
