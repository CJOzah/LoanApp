import 'package:credit_direct/theme/theme_provider.dart';
import 'package:credit_direct/utils.dart';
import 'package:credit_direct/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';

class SignUpDetailsScreen extends StatefulWidget {
  static String id = "SignUpDetailsScreen";
  const SignUpDetailsScreen({Key? key}) : super(key: key);

  @override
  _SignUpDetailsScreenState createState() => _SignUpDetailsScreenState();
}

class _SignUpDetailsScreenState extends State<SignUpDetailsScreen> {
  bool selected = false;

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final theme = Theme.of(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "images/blue_bg_image.png",
                ),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              InkWell(
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onTap: () => Navigator.pop(context),
              ),
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                "images/cdl-logo-1 1.png",
                fit: BoxFit.fill,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Sign up to\nCredit Direct",
                style: theme.textTheme.headline6!
                    .copyWith(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 40.0),
                child: Text(
                  "Set Password and Email Address",
                  style: theme.textTheme.bodyText2!.copyWith(color: grey500),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              RoundCustTextFieldWithIcon(
                  text: "First Name",
                  icon: CupertinoIcons.person,
                  textInputType: TextInputType.text,
                  controller: controller,
                  theme: theme),
              const SizedBox(
                height: 5,
              ),
              RoundCustTextFieldWithIcon(
                  text: "Last Name",
                  icon: CupertinoIcons.person,
                  textInputType: TextInputType.text,
                  controller: controller,
                  theme: theme),
              const SizedBox(
                height: 5,
              ),
              RoundCustTextFieldWithIcon(
                  text: "Email Addresss",
                  icon: Icons.mail_outline,
                  textInputType: TextInputType.text,
                  controller: controller,
                  theme: theme),
              const SizedBox(
                height: 5,
              ),
              RoundCustTextFieldWithIcon(
                  text: "password",
                  icon: Icons.lock_outline,
                  textInputType: TextInputType.text,
                  controller: controller,
                  theme: theme),
              SizedBox(
                height: SizeConfig.sW! * 10,
              ),
              Buttons(
                text: "Get Started",
                bgColor: theme.primaryColor,
                textColor: Colors.white,
                borderColor: Colors.transparent,
                heigbt: 50,
                width: double.infinity,
                radius: 30.0,
                borderStyle: BorderStyle.solid,
                onPressed: () => Navigator.pushNamed(context, WelcomeScreen.id),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: SizeConfig.sW! * 10,
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
    );
  }
}
