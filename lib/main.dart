import 'package:credit_direct/credit_direct.dart';
import 'package:credit_direct/home.dart';
import 'package:credit_direct/nav_bar.dart';
import 'package:credit_direct/onboard/onboard_page.dart';
import 'package:credit_direct/sign_up_screens/sign_up_details_screen.dart';
import 'package:credit_direct/sign_up_screens/sign_up_otp_screen.dart';
import 'package:credit_direct/sign_up_screens/sign_up_phone_number_screen.dart';
import 'package:credit_direct/splash_screen.dart';
import 'package:credit_direct/theme/theme_provider.dart';
import 'package:credit_direct/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

int? isviewed;
Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: SystemUiOverlay.values);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const CreditDirect());
}

class CreditDirect extends StatelessWidget {
  static String title = "MotherShip_Mobile";

  const CreditDirect({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);

          return ChangeNotifierProvider(
            create: (context) => CreditDirectData(),
            child: MaterialApp(
                themeMode: themeProvider.themeMode,
                theme: MyThemes.lightTheme,
                initialRoute: isviewed != 0 ? SplashScreeen.id : Home.id,
                debugShowCheckedModeBanner: false,
                routes: {
                  Home.id: (context) => const Home(),
                  OnBoardScreen.id: (context) => const OnBoardScreen(),
                  NavBar.id: (context) => const NavBar(),
                  SplashScreeen.id: (context) => const SplashScreeen(),
                  SignUpPhoneNumberScreen.id: (context) =>
                      const SignUpPhoneNumberScreen(),
                  SignUpOTPScreen.id: (context) => const SignUpOTPScreen(),
                  SignUpDetailsScreen.id: (context) =>
                      const SignUpDetailsScreen(),
                  WelcomeScreen.id: (context) => const WelcomeScreen(),
                }),
          );
        },
      );
}
