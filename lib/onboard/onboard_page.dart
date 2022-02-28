import 'dart:async';
import 'package:credit_direct/sign_up_screens/sign_up_phone_number_screen.dart';
import 'package:credit_direct/utilities/size_config.dart';
import 'package:credit_direct/utilities/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../theme/theme_provider.dart';

class OnBoardScreen extends StatefulWidget {
  static String id = "onboardScreen";
  const OnBoardScreen({
    Key? key,
  }) : super(key: key);

  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen>
    with TickerProviderStateMixin {
  int? currentIndex = 0;

  List<String> image = [
    "images/Happy Woman with money.png",
    "images/Coin image investment.png",
    "images/Coin image.png",
    "images/Happy Woman with money.png",
    "images/Coin image investment.png",
    "images/Coin image.png",
  ];
  List<String> image2 = [
    "images/woman_with_money_path.svg",
    "",
    "",
    "images/woman_with_money_path.svg",
    "",
    "",
  ];
  List<double>? width = [
    SizeConfig.sW! * 40,
    SizeConfig.sW! * 100,
    SizeConfig.sW! * 100,
    SizeConfig.sW! * 40,
    SizeConfig.sW! * 100,
    SizeConfig.sW! * 100
  ];
  List<String>? description = [
    "Get instant pay to fund your needs with peace of mind",
    "Get instant pay to fund your needs with peace of mind",
    "Get instant pay to fund your needs with peace of mind ",
    "Get instant pay to fund your needs with peace of mind",
    "Get instant pay to fund your needs with peace of mind",
    "Get instant pay to fund your needs with peace of mind ",
  ];
  List<String>? title = [
    "Fund Lifestyle",
    "Smart Investment",
    "Save with Us",
    "Fund Lifestyle",
    "Smart Investment",
    "Save with Us",
  ];

  Timer? _timer;
  int? _currentIndex = 0;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);

    _timer = Timer.periodic(const Duration(milliseconds: 2950), (timer) async {
      if (mounted) {
        setState(() {
          if (_currentIndex! + 1 == title!.length) {
            _controller.stop();
          } else {
            setState(() {
              _currentIndex = _currentIndex! + 1;
            });
          }
        });
      }
    });

    super.initState();
  }

  int? index = 0;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 3000),
    vsync: this,
  )..repeat(reverse: false);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    _timer!.cancel();
    super.dispose();
  }

  // _storeOnboardInfo() async {
  //   // print("Shared pref called");
  //   int isViewed = 0;
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setInt('onBoard', isViewed);
  //   // print(prefs.getInt('onBoard'));
  // }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    Future<bool> showExitPopup() async {
      return await showDialog(
            //show confirm dialogue
            //the return value will be from "Yes" or "No" options
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor:
                  isDarkMode ? theme.scaffoldBackgroundColor : Colors.white,
              title: Text('Exit App', style: theme.textTheme.bodyText1),
              content: Text('Do you want to exit this App?',
                  style: theme.textTheme.bodyText1),
              actions: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor),
                  ),
                  onPressed: () => Navigator.of(context).pop(false),
                  //return false when click on "NO"
                  child: const Text(
                    'No',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor),
                  ),
                  onPressed: () => Navigator.of(context).pop(true),
                  //return true when click on "Yes"
                  child: const Text(
                    'Yes',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ) ??
          false; //if showDialouge had returned null, then return false
    }

    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: WillPopScope(
        onWillPop: showExitPopup,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 2.0,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: 6,
                    shrinkWrap: false,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 18,
                          ),
                          Container(
                            padding: EdgeInsets.zero,
                            width: SizeConfig.sW! * 10,
                            height: 8,
                            decoration: BoxDecoration(
                              color: _currentIndex == index
                                  ? Theme.of(context).secondaryHeaderColor
                                  : Theme.of(context).dividerColor,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: SizeConfig.sW! * 80.0, top: 10),
                  child: InkWell(
                    child: const Icon(
                      CupertinoIcons.xmark,
                      color: Colors.grey,
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 100),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return FadeTransition(
                      opacity: _animation,
                      child: child,
                    );
                  },
                  child: OnboardWidget(
                    title: title![_currentIndex!],
                    description: description![_currentIndex!],
                    width: width![_currentIndex!],
                    image: image[_currentIndex!],
                    image2: image2[_currentIndex!],
                    key: ValueKey<int>(_currentIndex!),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.sH! * 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: Buttons(
                    text: "Get Started",
                    bgColor: theme.primaryColor,
                    textColor: Colors.white,
                    borderColor: Colors.transparent,
                    heigbt: 50,
                    width: double.infinity,
                    radius: 30.0,
                    borderStyle: BorderStyle.solid,
                    onPressed: () => Navigator.pushNamed(
                        context, SignUpPhoneNumberScreen.id),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.sW! * 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyText2!,
                    ),
                    Text(
                      "Login",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyText2!
                          .copyWith(color: theme.secondaryHeaderColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OnboardWidget extends StatefulWidget {
  OnboardWidget({
    Key? key,
    required this.image,
    this.image2,
    required this.width,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String? image;
  final String? image2;
  final String? title;
  final String? description;
  double? width;

  @override
  State<OnboardWidget> createState() => _OnboardWidgetState();
}

class _OnboardWidgetState extends State<OnboardWidget> {
  bool selected = false;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 200)).then((value) {
      setState(() {
        selected = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: SizeConfig.sH! * 72,
      width: double.infinity,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          AnimatedPositioned(
            top: selected ? SizeConfig.sH! * 0 : SizeConfig.sH! * -10,
            duration: const Duration(seconds: 1),
            child: Image.asset(
              widget.image!,
              fit: BoxFit.fill,
              height: SizeConfig.sH! * 50,
              width: widget.width,
            ),
          ),
          widget.image2 == ""
              ? const SizedBox(
                  width: double.infinity,
                )
              : Padding(
                  padding: EdgeInsets.only(
                    right: 20.0,
                    top: SizeConfig.sH! * 20,
                  ),
                  child: Hero(
                      tag: "icon",
                      child: SvgPicture.asset(
                        widget.image2!,
                        color: theme.scaffoldBackgroundColor,
                        fit: BoxFit.cover,
                      )),
                ),
          SizedBox(
            height: SizeConfig.sH! * 4,
          ),
          AnimatedPositioned(
            bottom: selected ? SizeConfig.sH! * 10 : SizeConfig.sH! * 15,
            duration: const Duration(seconds: 1),
            child: Text(
              widget.title!,
              style: theme.textTheme.headline5!.copyWith(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          AnimatedPositioned(
            bottom: selected ? 25 : SizeConfig.sH! * -10,
            left: 45.0,
            right: 45,
            duration: const Duration(seconds: 1),
            child: Text(
              widget.description!,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyText2!.copyWith(
                fontSize: 18,
                color: const Color(0xFF626E75),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
