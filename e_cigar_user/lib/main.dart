import 'package:e_cigar_user/Themes/style.dart';
import 'package:e_cigar_user/pages/landing_page.dart';
import 'package:e_cigar_user/pages/login_page.dart';
import 'package:e_cigar_user/pages/registration_page.dart';
import 'package:e_cigar_user/pages/verification_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'Locale/locales.dart';
import 'controllers/auth_controller.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
  Get.put(AuthController());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: const [
                  AppLocalizationsDelegate(),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
      theme: appTheme,
      supportedLocales: const [
        Locale('en'),
      ],
      // home:  RegistrationPage(phoneNumber: '+918610729733',),
      home:   LoginPage(),
      // routes: PageRoutes().routes(),
    );
  }
}

