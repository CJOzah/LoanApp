import 'package:credit_direct/sign_up_screens/sign_up_otp_screen.dart';
import 'package:credit_direct/theme/theme_provider.dart';
import 'package:credit_direct/utilities/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utilities/size_config.dart';

class SignUpPhoneNumberScreen extends StatefulWidget {
  static String id = "SignUpPhoneNumberScreen";
  const SignUpPhoneNumberScreen({Key? key}) : super(key: key);

  @override
  _SignUpPhoneNumberScreenState createState() =>
      _SignUpPhoneNumberScreenState();
}

class _SignUpPhoneNumberScreenState extends State<SignUpPhoneNumberScreen> {
  bool selected = false;

  @override
  void initState() {
    // TODO: implement initState

    Future.delayed(const Duration(seconds: 1)).then((value) {
      setState(() {
        selected = true;
      });
    });
  }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: theme.backgroundColor,
          iconTheme: theme.iconTheme.copyWith(color: Colors.black)),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "images/bgImage.png",
                    ),
                    fit: BoxFit.cover)),
            child: Stack(
              alignment: AlignmentDirectional.centerStart,
              children: [
                AnimatedPositioned(
                  top: selected ? SizeConfig.sH! * 15 : SizeConfig.sH! * 0,
                  left: SizeConfig.sW! * 65,
                  curve: Curves.easeInOut,
                  child: Image.asset("images/Ellipse light blue.png"),
                  duration: const Duration(milliseconds: 2000),
                ),
                AnimatedPositioned(
                  top: selected ? SizeConfig.sH! * 50 : SizeConfig.sH! * 40,
                  right: SizeConfig.sW! * 42,
                  curve: Curves.easeInOut,
                  child: Image.asset("images/Ellipse blue.png"),
                  duration: const Duration(milliseconds: 2000),
                ),
                AnimatedPositioned(
                  top: SizeConfig.sW! * 50,
                  left: selected ? SizeConfig.sW! * 90 : SizeConfig.sW! * 65,
                  curve: Curves.easeInOut,
                  child: Image.asset("images/Ellipse red.png"),
                  duration: const Duration(milliseconds: 2000),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: SizeConfig.sH! * 85,
                  ),
                  child: Image.asset(
                    "images/cdl-logo-1 1.png",
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: SizeConfig.sH! * 60,
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: Text(
                    "Welcome to\nCredit Direct",
                    style: theme.textTheme.headline6!
                        .copyWith(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: SizeConfig.sH! * 44,
                    left: 20.0,
                  ),
                  child: Text(
                    "Enter your registered mobile number to Login",
                    style: theme.textTheme.bodyText2!.copyWith(color: grey500),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.sH! * 64,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: SizeConfig.sH! * 20,
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: TextFieldWithCountryFlag(
                      controller: controller,
                      onchanged: (value) {},
                      validate: (validate) {
                        return validate!;
                      }),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: SizeConfig.sH! * 60,
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: Buttons(
                    text: "Login",
                    bgColor: theme.primaryColor,
                    textColor: Colors.white,
                    borderColor: Colors.transparent,
                    heigbt: 50,
                    width: double.infinity,
                    radius: 30.0,
                    borderStyle: BorderStyle.solid,
                    onPressed: () =>
                        Navigator.pushNamed(context, SignUpOTPScreen.id),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: SizeConfig.sH! * 80,
                  ),
                  child: Center(
                    child: Text(
                      "About",
                      style: theme.textTheme.bodyText1!.copyWith(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
