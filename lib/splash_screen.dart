import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:credit_direct/onboard/onboard_page.dart';
import 'package:credit_direct/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreeen extends StatefulWidget {
  static String id = "SplashScreen";
  const SplashScreeen({Key? key}) : super(key: key);

  @override
  _SplashScreeenState createState() => _SplashScreeenState();
}

class _SplashScreeenState extends State<SplashScreeen> {
  final Color textColor = Colors.black;
  Color? bgColor;
  Color? logoColor;

  bool selected = false;
  bool containerColor = false;
  bool resizeLogo = false;
  bool typerText = false;
  bool typerText2 = false;
  double? padding = 300.0;

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 1)).then((value) {
      setState(() {
        selected = true;
      });
    });
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final theme = Theme.of(context);
    bgColor = theme.scaffoldBackgroundColor;
    logoColor = theme.primaryColor;
    return Scaffold(
      body: AnimatedContainer(
        onEnd: () {},
        curve: Curves.fastOutSlowIn,
        height: double.infinity,
        width: double.infinity,
        color: containerColor ? theme.primaryColor : bgColor,
        duration: const Duration(seconds: 2),
        child: Padding(
          padding: const EdgeInsets.only(left: 40.0, right: 40.0),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              AnimatedPositioned(
                bottom: selected ? SizeConfig.sH! * 75 : SizeConfig.sH! * 85,
                duration: const Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 100.0,
                  ),
                  child: Text(
                    "Fast\nLoan",
                    style: theme.textTheme.bodyText2!.copyWith(
                        color: containerColor ? Colors.white : textColor),
                  ),
                ),
              ),
              AnimatedPositioned(
                bottom: selected ? SizeConfig.sH! * 65 : SizeConfig.sH! * 75,
                onEnd: () {
                  setState(() {
                    containerColor = true;
                  });
                  Future.delayed(const Duration(microseconds: 0)).then((value) {
                    setState(() {
                      resizeLogo = true;
                    });
                  });

                  Future.delayed(const Duration(milliseconds: 1200))
                      .then((value) {
                    setState(() {
                      typerText = true;
                    });
                  });

                  Future.delayed(const Duration(milliseconds: 1800))
                      .then((value) {
                    setState(() {
                      typerText2 = true;
                    });
                  });
                  Future.delayed(const Duration(milliseconds: 2000))
                      .then((value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OnBoardScreen(
                                 
                                )));
                  });
                },
                curve: Curves.fastOutSlowIn,
                duration: const Duration(seconds: 2),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 100.0,
                  ),
                  child: Text(
                    "Future",
                    style: theme.textTheme.bodyText2!.copyWith(
                        color: containerColor ? Colors.white : textColor),
                  ),
                ),
              ),
              AnimatedPositioned(
                height: resizeLogo ? 64 : 128,
                width: resizeLogo ? 86 : 173,
                left: resizeLogo ? SizeConfig.sW! * 3.0 : SizeConfig.sW! * 18,
                curve: Curves.elasticInOut,
                onEnd: () {
                  // setState(() {
                  //   typerText = true;
                  // });
                },
                duration: const Duration(seconds: 2),
                child: Hero(
                  tag: "icon",
                  child: SvgPicture.asset(
                    "images/CreditDirect Logo.svg",
                    color: containerColor ? Colors.white : logoColor,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              typerText
                  ? AnimatedContainer(
                      margin: const EdgeInsets.only(left: 0),
                      duration: const Duration(seconds: 0),
                      child: AnimatedTextKit(
                        onFinished: () {},
                        isRepeatingAnimation: false,
                        animatedTexts: [
                          TyperAnimatedText(
                            'credit',
                            textAlign: TextAlign.justify,
                            speed: const Duration(milliseconds: 100),
                            textStyle: const TextStyle(
                              fontFamily: "Avenir Next LT Pro",
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                            ),
                          ),
                        ],
                        onTap: () {},
                      ),
                    )
                  : const SizedBox(),
              typerText2
                  ? AnimatedContainer(
                      margin: const EdgeInsets.only(left: 170),
                      duration: const Duration(seconds: 0),
                      child: AnimatedTextKit(
                        isRepeatingAnimation: false,
                        animatedTexts: [
                          TyperAnimatedText(
                            'direct',
                            textAlign: TextAlign.justify,
                            speed: const Duration(microseconds: 100),
                            textStyle: const TextStyle(
                              fontFamily: "Avenir Next LT Pro",
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(),
              AnimatedPositioned(
                top: selected ? SizeConfig.sH! * 65 : SizeConfig.sH! * 75,
                curve: Curves.fastOutSlowIn,
                duration: const Duration(seconds: 2),
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 100.0,
                  ),
                  child: Text(
                    "Saving",
                    style: theme.textTheme.bodyText2!.copyWith(
                        color: containerColor ? Colors.white : textColor),
                  ),
                ),
              ),
              AnimatedPositioned(
                top: selected ? SizeConfig.sH! * 75 : SizeConfig.sH! * 85,
                curve: Curves.fastOutSlowIn,
                duration: const Duration(seconds: 2),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 100.0,
                  ),
                  child: Text(
                    "Smart\nInvestment",
                    style: theme.textTheme.bodyText2!.copyWith(
                        color: containerColor ? Colors.white : textColor),
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
