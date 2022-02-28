import 'package:credit_direct/theme/theme_provider.dart';
import 'package:flutter/material.dart';

import '../utilities/size_config.dart';

class VirtualCardsScreen extends StatelessWidget {
  static String id = "VirtualCardsScreen";
  const VirtualCardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                "Virtual Cards",
                style: theme.textTheme.headline6!.copyWith(
                  fontSize: 40,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: SizeConfig.sW! * 20),
                child: Text(
                  "Coming Soon",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headline6!.copyWith(
                    fontSize: 28,
                    color: grey300,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
