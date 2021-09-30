import 'dart:async';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:e_cigar_user/Components/bottom_bar.dart';
import 'package:e_cigar_user/Components/textfield.dart';
import 'package:e_cigar_user/Locale/locales.dart';
import 'package:e_cigar_user/controllers/controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//Verification page that sends otp to the phone number entered on phone number page
class VerificationPage extends StatelessWidget {
  VerificationPage({Key? key, required this.verificationId}) : super(key: key);

  final String verificationId;
  final _otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          AppLocalizations.of(context)!.verification!,
          style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 18),
        ),
      ),
      body: FadedSlideAnimation(
        //========================================OTP-VERIFY==============================================
        Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height - AppBar().preferredSize.height - 80,
                margin: const EdgeInsets.only(bottom: 150),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Divider(
                      color: Theme.of(context).cardColor,
                      thickness: 8.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        AppLocalizations.of(context)!.enterVerification!,
                        style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 22, color: Theme.of(context).secondaryHeaderColor),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: EntryField(AppLocalizations.of(context)!.verificationCode, '5 7 9 6 4 4', _otpController),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        TextButton(
                            style: TextButton.styleFrom(
                              shape: const RoundedRectangleBorder(side: BorderSide.none),
                              padding: const EdgeInsets.all(24.0),
                            ),
                            child: FadedScaleAnimation(
                              Text(
                                AppLocalizations.of(context)!.resend!,
                                style: TextStyle(
                                  fontSize: 16.7,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              durationInMilliseconds: 800,
                            ),
                            onPressed: () {}),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomBar(
                  text: AppLocalizations.of(context)!.continueText,
                  onTap: () async {
                    var credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: _otpController.text);
                    await authController.auth.firebaseAuth.signInWithCredential(credential);
                    
                  }),
            ),
          ],
        ),
        beginOffset: const Offset(0.0, 0.3),
        endOffset: const Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}

//otp verification class
