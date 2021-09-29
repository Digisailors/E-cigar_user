import 'package:e_cigar_user/models/users.dart';
import 'package:get/get.dart';


class UserController extends GetxController {
  final Customer customer;
  static UserController instance = Get.find();
  UserController(this.customer);
}