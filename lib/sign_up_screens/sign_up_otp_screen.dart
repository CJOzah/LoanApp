import 'package:credit_direct/sign_up_screens/sign_up_details_screen.dart';
import 'package:credit_direct/theme/theme_provider.dart';
import 'package:credit_direct/utilities/utils.dart';
import 'package:flutter/material.dart';

import '../utilities/size_config.dart';

class SignUpOTPScreen extends StatefulWidget {
  static String id = "SignUpOTPScreen";
  const SignUpOTPScreen({Key? key}) : super(key: key);

  @override
  _SignUpOTPScreenState createState() => _SignUpOTPScreenState();
}

class _SignUpOTPScreenState extends State<SignUpOTPScreen> {
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
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.all(20),
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
                height: 20,
              ),
              Text(
                "OTP Number",
                style: theme.textTheme.headline6!
                    .copyWith(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 40.0),
                child: Text(
                  "Verification number as been sent to your number 0806*****15",
                  style: theme.textTheme.bodyText2!.copyWith(color: grey500),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              CustTextField(
                  text: "Verification", controller: controller, theme: theme),
              SizedBox(
                height: SizeConfig.sH! * 45,
              ),
              Buttons(
                text: "Continue",
                bgColor: theme.primaryColor,
                textColor: Colors.white,
                borderColor: Colors.transparent,
                heigbt: 50,
                width: double.infinity,
                radius: 30.0,
                borderStyle: BorderStyle.solid,
                onPressed: () =>
                    Navigator.pushNamed(context, SignUpDetailsScreen.id),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
