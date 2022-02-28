
import 'package:credit_direct/utilities/size_config.dart';
import 'package:credit_direct/theme/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeLoanTab extends StatelessWidget {
  const HomeLoanTab({
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
          padding: const EdgeInsets.only(
              left: 10, right: 10, top: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'N632,040',
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
                "Loan Balance",
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
                            "Extra Cash",
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
                            Icons.arrow_upward,
                            size: 18,
                            color: theme.primaryColor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Payback",
                            style: theme.textTheme.bodyText1!.copyWith(
                              color: theme.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
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
                            "Payback",
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
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          padding: const EdgeInsets.only(
              left: 25, right: 25, top: 20, bottom: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("images/update_profile_icon.png"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Update profile",
                    style: theme.textTheme.bodyText1!.copyWith(),
                  ),
                  Text(
                    "Enable your loan account",
                    style: theme.textTheme.bodyText1!.copyWith(
                      fontSize: 14,
                      color: const Color(0xFFA9A9A9),
                    ),
                  ),
                ],
              ),
              const Icon(
                CupertinoIcons.arrow_right_circle,
                size: 40,
                color: Colors.green,
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

class HomeListViewItems extends StatelessWidget {
  const HomeListViewItems({
    Key? key,
    required this.image,
    required this.text,
  }) : super(key: key);

  final String? image;
  final String? text;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final theme = Theme.of(context);
    return Container(
      alignment: Alignment.bottomLeft,
      width: 175,
      margin: const EdgeInsets.only(left: 20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
            image: AssetImage(image!),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.srcOver)),
      ),
      child: Text(
        text!,
        style: theme.textTheme.bodyText2!.copyWith(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }
}
