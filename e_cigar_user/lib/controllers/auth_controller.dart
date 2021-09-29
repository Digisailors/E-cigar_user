import 'package:e_cigar_user/Services/auth.dart';
import 'package:get/get.dart';


class AuthController extends GetxController {
  static AuthController instance = Get.find();
  var auth = AuthenticationService();
}