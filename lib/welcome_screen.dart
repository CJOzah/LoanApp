import 'package:credit_direct/utilities/nav_bar.dart';
import 'package:credit_direct/theme/theme_provider.dart';
import 'package:credit_direct/utilities/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'utilities/size_config.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = "WelcomeScreen";
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool selected = false;

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
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
                "Welcome to Credit Direct",
                style: theme.textTheme.headline6!
                    .copyWith(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 40.0),
                child: Text(
                  "The future of fintech\nis now",
                  style: theme.textTheme.bodyText2!.copyWith(
                    fontFamily: "Avenir Next LT Pro",
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: SizeConfig.sH! * 10,
              ),
              Buttons(
                text: "Sign in",
                bgColor: theme.primaryColor,
                textColor: Colors.white,
                borderColor: Colors.transparent,
                heigbt: 50,
                width: double.infinity,
                radius: 30.0,
                borderStyle: BorderStyle.solid,
                onPressed: () => Navigator.pushNamed(context, NavBar.id),
              ),
              SizedBox(
                height: SizeConfig.sW! * 5,
              ),
              Buttons(
                text: "Become a Client",
                bgColor: theme.secondaryHeaderColor,
                textColor: Colors.white,
                borderColor: Colors.transparent,
                heigbt: 50,
                width: double.infinity,
                radius: 30.0,
                borderStyle: BorderStyle.solid,
                onPressed: () {},
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: SizeConfig.sH! * 28,
                ),
                child: Center(
                  child: Text(
                    "About Us",
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
