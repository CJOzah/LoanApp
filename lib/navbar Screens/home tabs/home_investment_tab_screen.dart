import 'package:credit_direct/theme/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'home_loan_tab_screen.dart';

class HomeInvestmentTab extends StatelessWidget {
  const HomeInvestmentTab({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              )),
          margin: const EdgeInsets.only(left: 20.0, right: 20),
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'N600,000',
                    style: theme.textTheme.bodyText1!.copyWith(
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Icon(
                    FontAwesomeIcons.angleDown,
                    color: Colors.black,
                  ),
                  const Icon(
                    CupertinoIcons.eye,
                    color: Colors.black,
                  ),
                ],
              ),
              Text(
                "Asset worth",
                style: theme.textTheme.bodyText2!.copyWith(
                  color: const Color(0xFFA9A9A9),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: theme.primaryColorLight,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_downward,
                            size: 18,
                            color: theme.primaryColor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Invest",
                            style: theme.textTheme.bodyText1!.copyWith(
                              color: theme.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: theme.primaryColorLight,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_downward,
                            size: 18,
                            color: theme.primaryColor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Invest",
                            style: theme.textTheme.bodyText1!.copyWith(
                              color: theme.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                ],
              ),
              const SizedBox(
                height: 19,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Transactions",
                    style: theme.textTheme.bodyText1!
                        .copyWith(fontSize: 14, color: grey500),
                  ),
                  Text(
                    "See all",
                    style: theme.textTheme.bodyText1!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: theme.primaryColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFFE6F2ED),
                        ),
                        child: const Icon(
                          CupertinoIcons.arrowtriangle_up_fill,
                          size: 20,
                          color: Color(0xFF05944F),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Mutual Fund",
                            style: theme.textTheme.bodyText2!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "1:58 PM",
                            style: theme.textTheme.bodyText1!.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFFA9A9A9)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    "N100,000",
                    style: theme.textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            "Recommended for you",
            style: theme.textTheme.bodyText1!.copyWith(
              fontSize: 14,
              color: grey400,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 164,
          width: double.infinity,
          child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return const HomeListViewItems(
                  text: "Pay for school",
                  image: "images/home_image.jpg",
                );
              }),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(left: 20, right: 20.0),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage("images/home_rectangle_blue.png"),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Refer and Earn",
                style: theme.textTheme.bodyText2!.copyWith(
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),
              Text(
                "Get Instant reward",
                style: theme.textTheme.bodyText2!.copyWith(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
