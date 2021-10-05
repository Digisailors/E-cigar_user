import 'package:animation_wrappers/Animations/faded_slide_animation.dart';
import 'package:e_cigar_user/Components/bottom_bar.dart';
import 'package:e_cigar_user/Components/textfield.dart';
import 'package:e_cigar_user/Locale/locales.dart';
import 'package:e_cigar_user/Routes/routes.dart';
import 'package:e_cigar_user/Services/db.dart';
import 'package:e_cigar_user/Themes/colors.dart';
import 'package:e_cigar_user/controllers/controller.dart';
import 'package:e_cigar_user/controllers/user_controller.dart';
import 'package:e_cigar_user/models/users.dart';
import 'package:e_cigar_user/pages/verification_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class RegistrationPage extends StatelessWidget {
  RegistrationPage({Key? key, required this.phoneNumber}) : super(key: key);

  String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          AppLocalizations.of(context)!.register!,
          style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 20),
        ),
      ),
      body: FadedSlideAnimation(
        RegisterForm(
          phoneNumber: phoneNumber,
        ),
        beginOffset: Offset(0.0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}

class RegisterForm extends StatelessWidget {
  @override
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final String phoneNumber;
  RegisterForm({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Divider(
                  color: Theme.of(context).cardColor,
                  thickness: 8.0,
                ),
                const SizedBox(
                  height: 25,
                ),
                //name textField
                inputField(AppLocalizations.of(context)!.fullName!.toUpperCase(), 'Samantha Smith', 'images/icons/ic_name.png', _nameController),
                //email textField
                inputField(AppLocalizations.of(context)!.emailAddress!.toUpperCase(), 'samanthasmith@mail.com', 'images/icons/ic_mail.png',
                    _emailController),

                //phone textField
                inputField(AppLocalizations.of(context)!.mobileNumber!.toUpperCase(), phoneNumber, 'images/icons/ic_phone.png', null),

                Padding(
                  padding: const EdgeInsets.only(left: 16.0, bottom: 80),
                  child: Text(
                    AppLocalizations.of(context)!.verificationText!,
                    style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 12.8),
                  ),
                ),
              ],
            ),
          ),
        ),
        //continue button bar
        Align(
          alignment: Alignment.bottomCenter,
          child: BottomBar(
              text: "Continue",
              onTap: () async {
                var customer = Customer(bioData: BioData(name: _nameController.text, phone: phoneNumber, uid:  authController.auth.currentUser!.uid, role: Role.CUSTOMER));
                await addCustomer(customer);
              }),
        )
      ],
    );
  }

  inputField(String title, String hint, String img, TextEditingController? controller) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: 20,
              child: Image(
                image: AssetImage(
                  img,
                ),
                color: kMainColor,
              ),
            ),
            const SizedBox(
              width: 13,
            ),
            Text(title, style: TextStyle(color: Colors.grey[600], fontSize: 12))
          ],
        ),
        Container(
          padding: const EdgeInsets.only(left: 33),
          child: Column(
            children: [
              SmallTextFormField(null, hint, controller),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
