
import 'package:credit_direct/home.dart';
import 'package:credit_direct/size_config.dart';
import 'package:credit_direct/theme/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

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
      bottomNavigationBar: AnimatedContainer(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        duration: const Duration(milliseconds: 1000),
        child: SingleChildScrollView(
          child: BottomNavigationBar(
            selectedLabelStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            unselectedItemColor:
                isDarkMode ? const Color(0xFFA0AAB8) : Colors.black,
            selectedItemColor:
                isDarkMode ? theme.primaryColorLight : Colors.black,
            selectedIconTheme: Theme.of(context).iconTheme.copyWith(),
            unselectedIconTheme: Theme.of(context)
                .iconTheme
                .copyWith(color: const Color(0xFFA0AAB8)),
            type: BottomNavigationBarType.fixed,
            iconSize: 22.0,
            currentIndex: _index!,
            onTap: onTabTapped,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: Icon(Icons.home),
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: Icon(
                    CupertinoIcons.creditcard_fill,
                  ),
                ),
                label: "Cards",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: Icon(Icons.home),
                ),
                label: "Transactions",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: Icon(Icons.home),
                ),
                label: "Overview",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                  child: Icon(Icons.home),
                ),
                label: "Settings",
              ),
            ],
          ),
        ),
      ),
      body: WillPopScope(
        onWillPop: showExitPopup,
        child: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: PageView(
              children: const [
                Home(),
              ],
              onPageChanged: onPageChanged,
              controller: _pageController,
            ),
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
