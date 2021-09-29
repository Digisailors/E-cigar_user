import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_cigar_user/Services/db.dart';
import 'package:e_cigar_user/controllers/controller.dart';
import 'package:e_cigar_user/controllers/user_controller.dart';
import 'package:e_cigar_user/models/users.dart';
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
              return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                stream: getProfile(auth.currentUser!.uid),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.active &&
                      snapshot.hasData) {
                      if(snapshot.data.data()!=null){
                        var customer = Customer.fromJson(snapshot.data.data());
                        Get.put(UserController(customer));
                        return  Container();
                      } else {
                        return  RegistrationPage(phoneNumber : auth.currentUser!.phoneNumber!);
                      }
                    }
                  else {
                    return const Scaffold();
                  }
                },
              );
            }
          } else {
            return const Scaffold();
          }
        });
  }
}
