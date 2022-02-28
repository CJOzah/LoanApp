import 'package:credit_direct/navbar%20Screens/virtual_cards_Screens.dart';
import 'package:credit_direct/utilities/size_config.dart';
import 'package:credit_direct/theme/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../navbar Screens/home tabs/home.dart';
import 'app_icons.dart';

class NavBar extends StatefulWidget {
  static String id = "NavBar";
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int? _index = 0;
  PageController? _pageController;

  bool _isVisible = true;
  ScrollController? controller;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    controller = ScrollController();
    controller!.addListener(() {
      if (controller!.position.userScrollDirection == ScrollDirection.reverse) {
        if (_isVisible) {
          setState(() {
            _isVisible = false;
            debugPrint("Nav bar not visible");
          });
        }
      }
      if (controller!.position.userScrollDirection == ScrollDirection.forward) {
        if (!_isVisible) {
          setState(() {
            debugPrint("Nav bar  visible");
            _isVisible = true;
          });
        }
      }
    });
    _pageController = PageController(initialPage: _index!);
  }

  @override
  void dispose() {
    _pageController!.dispose();
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    SizeConfig().init(context);
    final theme = Theme.of(context);
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

    return Scaffold(
      body: WillPopScope(
        onWillPop: showExitPopup,
        child: SafeArea(
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: PageView(
                  children: const [
                    Home(),
                    SizedBox(),
                    VirtualCardsScreen(),
                  ],
                  onPageChanged: onPageChanged,
                  controller: _pageController,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: SingleChildScrollView(
                  child: Container(
                    margin:
                        const EdgeInsets.only(left: 70, right: 70, bottom: 40),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                      ),
                      child: BottomNavigationBar(
                        showSelectedLabels: false,
                        showUnselectedLabels: false,
                        unselectedItemColor: Colors.black,
                        selectedItemColor: Colors.black,
                        selectedIconTheme:
                            Theme.of(context).iconTheme.copyWith(),
                        unselectedIconTheme: Theme.of(context)
                            .iconTheme
                            .copyWith(color: const Color(0xFFA0AAB8)),
                        type: BottomNavigationBarType.fixed,
                        iconSize: 8.0,
                        currentIndex: _index!,
                        onTap: onTabTapped,
                        backgroundColor: Colors.white.withOpacity(0.9),
                        items: const <BottomNavigationBarItem>[
                          BottomNavigationBarItem(
                            label: "",
                            icon: Padding(
                              padding: EdgeInsets.only(
                                top: 5.0,
                              ),
                              child: Icon(
                                AppIcons.creditdirectlogo,
                                size: 15,
                              ),
                            ),
                          ),
                          BottomNavigationBarItem(
                            label: "",
                            icon: Padding(
                              padding: EdgeInsets.only(
                                top: 5.0,
                              ),
                              child: Icon(
                                AppIcons.transfer_icon,
                                size: 18,
                              ),
                            ),
                          ),
                          BottomNavigationBarItem(
                            label: "",
                            icon: Padding(
                              padding: EdgeInsets.only(
                                top: 5.0,
                              ),
                              child: Icon(
                                CupertinoIcons.creditcard_fill,
                                size: 18,
                              ),
                            ),
                          ),
                          BottomNavigationBarItem(
                            label: "",
                            icon: Padding(
                              padding: EdgeInsets.only(
                                top: 5.0,
                              ),
                              child: Icon(
                                AppIcons.grid,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      _index = page;
    });
  }

  void onTabTapped(int index) {
    _pageController!.jumpToPage(index);
  }
}
