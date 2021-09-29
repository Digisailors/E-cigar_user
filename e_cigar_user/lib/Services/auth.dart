// ignore_for_file: avoid_print, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class AuthenticationService extends ChangeNotifier {
  final firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  static String _uid = '';
  late ConfirmationResult result;

  set uid(text) => {_uid = text};

  String get uid => _uid;

  Stream<User?> authStateChanges() => firebaseAuth.authStateChanges();
  User? get currentUser => firebaseAuth.currentUser;

  Future<String> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print(userCredential.user!.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // print('No user found for that email.');
        return "error" + e.code;
      } else if (e.code == 'wrong-password') {
        // print('Wrong password provided for that user.');
        return "error" + e.code;
      }
    }
    return "error Unknown";
  }

  verifyPhoneNumber({required String phoneNumber, required String otp, codeSent}) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      codeSent: (String verificationId, int? resendToken) async {
        String smsCode = otp;
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsCode);
        await FirebaseAuth.instance.signInWithCredential(credential);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {},
      verificationFailed: (FirebaseAuthException error) {},
    );
  }

  Future<String> signInAnonymously() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInAnonymously();
      print(userCredential.user!.uid);
    } on FirebaseAuthException catch (e) {
      print("error : + ${e.message}");
      return "error : + ${e.message}";
    }
    return "error Unknown";
  }

  Future<void> signInWithPhoneNumber(String phoneNumber) async {
    result =
        await FirebaseAuth.instance.signInWithPhoneNumber(
      phoneNumber,
    );
  }

  Future<void> logout() async {
    firebaseAuth.signOut();
  }
}
