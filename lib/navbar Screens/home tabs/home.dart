import 'package:credit_direct/utilities/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_investment_tab_screen.dart';
import 'home_loan_tab_screen.dart';
import 'home_wallet_tab_screen.dart';

class Home extends StatefulWidget {
  static String id = "Home";
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    int? index = 0;
    SizeConfig().init(context);
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          SizedBox(
                            height: 30,
                            width: 30,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                "images/profile_image.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Image.asset(
                            "images/Ellipse 14.png",
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Hi, Shelia",
                        style:
                            theme.textTheme.bodyText2!.copyWith(fontSize: 18),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Icon(
                          CupertinoIcons.question,
                          size: 12,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          const Icon(
                            CupertinoIcons.bell_fill,
                            color: Colors.black,
                            size: 20,
                          ),
                          Image.asset(
                            "images/Ellipse 14.png",
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            DefaultTabController(
              length: 3, // length of tabs
              initialIndex: 0,
              child: Column(
                children: <Widget>[
                  Container(
                    decoration:
                        BoxDecoration(color: theme.scaffoldBackgroundColor),
                    padding: const EdgeInsets.only(left: 20, right: 100),
                    child: TabBar(
                      labelPadding: EdgeInsets.zero,
                      indicatorPadding: EdgeInsets.zero,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorColor: theme.scaffoldBackgroundColor,
                      labelColor: Colors.black,
                      onTap: (indx) {
                        setState(() {
                          index = indx;
                          // print(index);
                        });
                      },
                      padding: EdgeInsets.zero,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                                color: index == 0
                                    ? Colors.white
                                    : theme.scaffoldBackgroundColor,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5))),
                            child: const Center(child: Text('Loan')),
                          ),
                          iconMargin: EdgeInsets.zero,
                        ),
                        Tab(
                          child: Container(
                            decoration: BoxDecoration(
                                color: index == 1
                                    ? Colors.white
                                    : theme.scaffoldBackgroundColor,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            width: double.infinity,
                            height: double.infinity,
                            child: const Center(child: Text('Wallet')),
                          ),
                          iconMargin: EdgeInsets.zero,
                        ),
                        Tab(
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                                color: index == 2
                                    ? Colors.white
                                    : theme.scaffoldBackgroundColor,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            child: const Center(child: Text('Investment')),
                          ),
                          iconMargin: EdgeInsets.zero,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.sH! * 100,
                    child:
                        TabBarView(physics: const ScrollPhysics(), children: [
                      HomeLoanTab(theme: theme),
                      HomeWalletTab(theme: theme),
                      HomeInvestmentTab(theme: theme),
                    ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
