import 'package:animation_wrappers/Animations/faded_slide_animation.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:e_cigar_user/Components/entry_field.dart';
import 'package:e_cigar_user/Locale/locales.dart';
import 'package:e_cigar_user/Routes/routes.dart';
import 'package:e_cigar_user/controllers/controller.dart';
import 'package:e_cigar_user/pages/registration_page.dart';
import 'package:e_cigar_user/pages/verification_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadedSlideAnimation(
        SingleChildScrollView(
          child: Container(
            color: Theme.of(context).cardColor,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                const Spacer(),
                Expanded(
                    flex: 3,
                    child: FadedSlideAnimation(
                      Image.asset("images/logouser.png"),
                      durationInMilliseconds: 300,
                      beginOffset: const Offset(0, 0),
                      endOffset: const Offset(0, 0),
                    )),
                const Spacer(),
                Expanded(
                  flex: 3,
                  child: Image.asset("images/signin hero.png"),
                ),
                MobileInput(),
              ],
            ),
          ),
        ),
        beginOffset: const Offset(0.0, 0.3),
        endOffset: const Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}

class MobileInput extends StatefulWidget {
  @override
  _MobileInputState createState() => _MobileInputState();
}

class _MobileInputState extends State<MobileInput> {
  final TextEditingController _controller = TextEditingController();
  String? isoCode = '+91';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(color: Color(0xffF9F9FD)),
      child: Row(
        children: <Widget>[
          CountryCodePicker(
            onChanged: (value) {
              isoCode = value.dialCode;
            },
            builder: (value) => buildButton(value),
            initialSelection: '+91',
            textStyle: Theme.of(context).textTheme.caption,
            showFlag: false,
            showFlagDialog: true,
            favorite: const ['+91', 'IN'],
          ),
          const SizedBox(
            width: 10.0,
          ),
          //takes phone number as input
          Expanded(
            child: EntryField(
              controller: _controller,
              keyboardType: TextInputType.number,
              readOnly: false,
              hint: AppLocalizations.of(context)!.mobileText,
              maxLength: 10,
              border: InputBorder.none,
            ),
          ),

          //if phone number
          // is valid, button gets enabled and takes to register screen
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Text(
                AppLocalizations.of(context)!.continueText!,
                style: Theme.of(context).textTheme.button,
              ),
            ),
            onPressed: () {
              authController.auth.firebaseAuth.verifyPhoneNumber(
                          phoneNumber: isoCode!+_controller.text,
                          verificationCompleted: (credential) async {
                            await authController.auth.firebaseAuth.signInWithCredential(credential);
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Container()));
                          },
                          verificationFailed: (verificationFailed) {

                          },
                          codeSent: (String verificationId, int? resendToken) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => VerificationPage(verificationId: verificationId,)));
                            
                          },
                          codeAutoRetrievalTimeout: (String timeOut) {

                          });
            },
          ),
        ],
      ),
    );
  }

  buildButton(CountryCode? isoCode) {
    return Row(
      children: <Widget>[
        Text(
          '$isoCode',
          style: Theme.of(context).textTheme.caption,
        ),
      ],
    );
  }
}
