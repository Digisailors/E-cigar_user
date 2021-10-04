
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_cigar_user/Services/db.dart';
import 'package:e_cigar_user/controllers/controller.dart';
import 'package:e_cigar_user/controllers/user_controller.dart';
import 'package:e_cigar_user/models/users.dart';
import 'package:e_cigar_user/pages/App/_home_order_account.dart';
import 'package:e_cigar_user/pages/login_page.dart';
import 'package:e_cigar_user/pages/registration_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class LandingPage extends StatelessWidget {
  LandingPage({Key? key}) : super(key: key);
  final auth = authController.auth;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final User? user = snapshot.data;
            if (user == null) {
              return const LoginPage();
            } else {
              return FutureBuilder(
                future: getProfileAsFuture(auth.currentUser!.uid),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if(snapshot.hasError){
                    return const Text("Something Went Wrrong");
                  } 
                  if(snapshot.hasData && !snapshot.data.exists) {
                    return RegistrationPage(phoneNumber: auth.currentUser!.phoneNumber!);
                  } 
                  if(snapshot.connectionState == ConnectionState.done){
                    Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                    Get.put(UserController(Customer.fromJson(data)));
                    return HomeOrderAccount();
                  }
                  return const Scaffold(body: Center(child: CircularProgressIndicator()),);
                },
              );
            }
          } else {
            return const Scaffold();
          }
        });
  }
}

