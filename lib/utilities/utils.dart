//Design for rounded rectangle border for buttons
import 'dart:io';

import 'package:country_pickers/country_pickers.dart';
import 'package:credit_direct/utilities/credit_direct.dart';
import 'package:credit_direct/utilities/size_config.dart';
import 'package:credit_direct/theme/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Buttons extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? bgColor;
  final Color? borderColor;
  final Function()? onPressed;
  final double? heigbt;
  final double? width;
  final double? radius;
  final BorderStyle? borderStyle;
  const Buttons({
    Key? key,
    required this.text,
    this.bgColor,
    this.borderColor,
    this.textColor,
    this.onPressed,
    this.heigbt,
    this.width,
    this.radius,
    this.borderStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return TextButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(Size(width!, heigbt!)),
        backgroundColor: MaterialStateProperty.all(bgColor),
        side: MaterialStateProperty.all(BorderSide(
          color: borderColor!,
          style: borderStyle!,
          width: 2.0,
        )),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius!),
        )),
      ),
      onPressed: onPressed!,
      child: Text(text,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 18,
                color: isDarkMode ? Colors.white : textColor,
              )),
    );
  }
}

class CustTextField extends StatelessWidget {
  const CustTextField({
    Key? key,
    required TextEditingController? controller,
    required this.theme,
    this.text,
    this.validate,
    this.onchanged,
    this.border = false,
    this.obscure = false,
    this.textInputType = TextInputType.text,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController? _controller;
  final ThemeData theme;
  final String? text;
  final bool? border;
  final bool? obscure;
  final String? Function(String?)? validate;
  final Function(String)? onchanged;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 10, right: 10),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12.0)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12.0)),
        fillColor: Colors.white,
        filled: true,
        hintText: text,
        hintStyle: const TextStyle(
          fontSize: 15.0,
          color: Color(0xFF757575),
        ),
        enabled: true,
        suffix: Container(
          height: 25,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.grey.shade400,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              "22",
              style: theme.textTheme.bodyText1!.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
      keyboardType: TextInputType.phone,
      cursorColor: Colors.black,
      textAlign: TextAlign.start,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 18.0,
      ),
      onChanged: onchanged,
      validator: validate,
    );
  }
}

// ignore: must_be_immutable
class TextFieldWithCountryFlag extends StatelessWidget {
  TextFieldWithCountryFlag({
    Key? key,
    @required TextEditingController? controller,
    this.icon,
    this.iconFunction,
    this.iconColor,
    this.iconSize,
    @required this.onchanged,
    @required this.validate,
    this.textInputType,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController? _controller;
  final IconData? icon;
  final Function? iconFunction;
  final Color? iconColor;
  final double? iconSize;
  final Function(String?)? onchanged;
  final String Function(String?)? validate;
  final TextInputType? textInputType;
  Color? textColor;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    textColor = isDarkMode ? Colors.white : const Color(0xFF20173D);
    Widget getCountryFlag(double height, double width) {
      return Image.asset(
        CountryPickerUtils.getFlagImageAssetPath(
            Provider.of<CreditDirectData>(context).getIso()),
        height: height,
        width: width,
        fit: BoxFit.fill,
        package: "country_pickers",
      );
    }

    SizeConfig().init(context);

    return SizedBox(
      height: 50.0,
      child: Card(
        color: Colors.transparent,
        margin: const EdgeInsets.only(top: 0),
        elevation: 0,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                width: double.infinity,
                height: 50.0,
                child: Row(
                  children: <Widget>[
                    const Expanded(
                      flex: 2,
                      child: Icon(
                        CupertinoIcons.person,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Text(
                        "+234",
                        style: theme.textTheme.bodyText1!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: InkWell(
                        onTap: () {
                          CreditDirectData().openCountryPickerDialog(context);
                        },
                        child: const Icon(
                          FontAwesomeIcons.angleDown,
                          color: Colors.black,
                          size: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: SizeConfig.sW! * 2,
            ),
            Expanded(
              flex: 8,
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 10),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12.0)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12.0)),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Mobile Number",
                  hintStyle: TextStyle(
                    fontSize: 15.0,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                keyboardType: TextInputType.phone,
                cursorColor: Colors.black,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
                onChanged: onchanged,
                validator: validate,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HorizontalLine extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;

  const HorizontalLine({
    Key? key,
    this.width,
    this.height,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: color,
    );
  }
}

class IconsButton extends StatelessWidget {
  final Function()? function;
  final IconData? icon;
  final double? size;
  final Color? color;

  const IconsButton({
    Key? key,
    @required this.function,
    @required this.icon,
    this.size,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        color: color,
        size: size,
      ),
      onPressed: function!,
    );
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({
    Key? key,
    required this.theme,
    this.icon,
    this.text,
    this.ontap,
  }) : super(key: key);

  final IconData? icon;
  final String? text;
  final Function()? ontap;

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return Column(
      children: [
        InkWell(
          onTap: ontap,
          child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: isDarkMode
                        ? theme.primaryColor
                        : const Color(0xFFECECEF),
                    spreadRadius: isDarkMode ? 1 : 10,
                    blurRadius: 10,
                    offset: const Offset(0, 5), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(60),
                color: theme.scaffoldBackgroundColor,
              ),
              child: Icon(
                icon,
                color: isDarkMode
                    ? theme.primaryColorLight
                    : const Color(0xFF53227E),
              )),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text!,
          style: theme.textTheme.bodyText1,
        ),
      ],
    );
  }
}

Widget greeting() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return Row(
      children: const [
        Text('Good morning'),
        Text(
          " 🌤️",
          style: TextStyle(fontSize: 22),
        ),
      ],
    );
  }
  if (hour < 17) {
    return Row(
      children: const [
        Text('Good afternoon'),
        Text(
          " ☀️",
          style: TextStyle(fontSize: 22),
        ),
      ],
    );
  }
  return Row(
    children: const [
      Text('Good evening'),
      Text(
        " ☁️",
        style: TextStyle(fontSize: 22),
      ),
    ],
  );
}

class CustListTile extends StatelessWidget {
  const CustListTile({
    Key? key,
    required this.theme,
    @required this.title,
    @required this.subtitle,
    this.icon,
    this.ontap,
    this.bgcolor,
  }) : super(key: key);

  final ThemeData theme;
  final String? title;
  final String? subtitle;
  final IconData? icon;
  final Function()? ontap;
  final Color? bgcolor;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return ListTile(
      onTap: ontap,
      minLeadingWidth: 10,
      contentPadding: const EdgeInsets.all(0),
      leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: isDarkMode ? theme.primaryColor.withOpacity(0.2) : bgcolor,
              borderRadius: BorderRadius.circular(20)),
          child: Center(child: Icon(icon))),
      title: Text(
        title!,
        style: theme.textTheme.bodyLarge!
            .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      subtitle: subtitle == ""
          ? null
          : Text(
              subtitle!,
              style: theme.textTheme.bodyText1!.copyWith(
                color: theme.dividerColor,
                height: 1.3,
              ),
            ),
      trailing: const Icon(FontAwesomeIcons.angleRight),
      iconColor: isDarkMode ? theme.primaryColorLight : theme.primaryColor,
    );
  }
}

Future<void> showSizeSheet(BuildContext context, double leftMargin,
    double rightMargin, double bottomMargin, Widget widget) {
  final theme = Theme.of(context);
  bool isDarkMode =
      Provider.of<ThemeProvider>(context, listen: false).isDarkMode;
  return showModalBottomSheet<void>(
    isDismissible: true,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
        return Wrap(
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: leftMargin, right: rightMargin, bottom: bottomMargin),
              padding: MediaQuery.of(context).viewInsets,
              decoration: BoxDecoration(
                color:
                    isDarkMode ? theme.scaffoldBackgroundColor : Colors.white,
                borderRadius: BorderRadius.circular(SizeConfig.sW! * 3),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: widget,
                ),
              ),
            ),
          ],
        );
      });
    },
  );
}

class CustTextFieldWithDropdown extends StatelessWidget {
  const CustTextFieldWithDropdown({
    Key? key,
    required TextEditingController? controller,
    required this.theme,
    this.text,
    this.validate,
    this.onchanged,
    this.border = false,
    this.obscure = false,
    this.inputType = TextInputType.phone,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController? _controller;
  final ThemeData theme;
  final String? text;
  final bool? border;
  final bool? obscure;
  final TextInputType? inputType;
  final String? Function(String?)? validate;
  final Function(String)? onchanged;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        fillColor: isDarkMode
            ? theme.scaffoldBackgroundColor
            : const Color(0xFFF8F7FE),
        filled: true,
        enabledBorder: border! == true
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  style: BorderStyle.solid,
                  width: 2.0,
                  color: Color(0xFFECEBEF),
                ),
              )
            : InputBorder.none,
        border: border! == true
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  style: BorderStyle.solid,
                  width: 2.0,
                  color: theme.primaryColorLight,
                ),
              )
            : InputBorder.none,
        hintText: text,
        contentPadding: const EdgeInsets.all(10.0),
        hintStyle: theme.textTheme.bodyMedium!.copyWith(
            color:
                isDarkMode ? theme.primaryColorLight : const Color(0xFF607288)),
      ),
      keyboardType: inputType,
      cursorColor: theme.primaryColor,
      textAlign: TextAlign.start,
      style: theme.textTheme.bodyText1,
      onChanged: onchanged,
      validator: validate,
    );
  }
}

class AmountTextField extends StatelessWidget {
  const AmountTextField({
    Key? key,
    @required TextEditingController? controller,
    this.icon,
    this.iconFunction,
    this.iconColor,
    this.iconSize,
    @required this.onchanged,
    @required this.validate,
    this.textInputType,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController? _controller;
  final IconData? icon;
  final Function? iconFunction;
  final Color? iconColor;
  final double? iconSize;
  final Function(String?)? onchanged;
  final String Function(String?)? validate;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    Widget getCountryCurrency(double height, double width) {
      // Locale locale = Localizations.localeOf(context);
      var format = NumberFormat.simpleCurrency(
          locale: Platform.localeName,
          name: Provider.of<CreditDirectData>(context).getIso3());
      // String countryCode = Provider.of<CountryData>(context).getIso();
      debugPrint(Provider.of<CreditDirectData>(context).getIso());
      return Text(format.currencySymbol);
    }

    SizeConfig().init(context);

    final theme = Theme.of(context);
    bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;

    return SizedBox(
      height: 40.0,
      child: Card(
        margin: const EdgeInsets.only(top: 0),
        elevation: 0,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 2.0,
            color: isDarkMode ? Colors.white : const Color(0xFFF1EBF7),
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.only(left: 12),
                decoration: BoxDecoration(
                  color: isDarkMode
                      ? theme.scaffoldBackgroundColor
                      : const Color(0xFFF8F7FE),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0)),
                ),
                alignment: Alignment.center,
                width: double.infinity,
                height: 40.0,
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: getCountryCurrency(
                          SizeConfig.sW! * 5.5, SizeConfig.sW! * 6.5),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 12,
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: isDarkMode
                      ? theme.scaffoldBackgroundColor
                      : const Color(0xFFF1EBF7),
                  contentPadding: const EdgeInsets.only(left: 10),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color:
                          isDarkMode ? Colors.white : const Color(0xFFF1EBF7),
                      style: BorderStyle.solid,
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color:
                          isDarkMode ? Colors.white : const Color(0xFFF1EBF7),
                      style: BorderStyle.solid,
                      width: 2.0,
                    ),
                  ),
                  hintText: "0",
                  hintStyle: const TextStyle(
                    fontSize: 15.0,
                  ),
                ),
                keyboardType: TextInputType.phone,
                cursorColor: Colors.black,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                  fontSize: 18.0,
                ),
                onChanged: onchanged,
                validator: validate,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TransactionsListTile extends StatelessWidget {
  const TransactionsListTile({
    Key? key,
    required this.theme,
    this.title,
    @required this.subtitle,
    this.icon,
    this.ontap,
    this.bgcolor,
    @required this.amount,
    @required this.date,
  }) : super(key: key);

  final ThemeData theme;
  final String? title;
  final String? subtitle;
  final String? amount;
  final String? date;
  final IconData? icon;
  final Function()? ontap;
  final Color? bgcolor;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return ListTile(
      onTap: ontap,
      minLeadingWidth: 10,
      contentPadding: const EdgeInsets.all(0),
      leading: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              color: bgcolor!.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15)),
          child: Center(
              child: Icon(
            icon,
            size: 15,
            color: bgcolor,
          ))),
      title: Text(
        (title == "") ? subtitle! : title!,
        style: (title == "")
            ? theme.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold)
            : theme.textTheme.bodySmall!.copyWith(
                color: isDarkMode ? theme.primaryColorLight : Colors.black,
                fontWeight: FontWeight.bold),
      ),
      subtitle: (title == "")
          ? const SizedBox()
          : Text(
              subtitle!,
              style: theme.textTheme.bodyText1!
                  .copyWith(fontWeight: FontWeight.bold, height: 1.3),
            ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            amount!,
            style: theme.textTheme.bodyText1!
                .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            date!,
            style: theme.textTheme.bodySmall!,
          ),
        ],
      ),
      iconColor: theme.primaryColor,
    );
  }
}

class TransactionsHistoryListTile extends StatelessWidget {
  const TransactionsHistoryListTile({
    Key? key,
    required this.theme,
    this.title,
    this.icon,
    this.ontap,
    this.bgcolor,
    @required this.amount,
    @required this.date,
  }) : super(key: key);

  final ThemeData theme;
  final String? title;
  final String? amount;
  final String? date;
  final IconData? icon;
  final Function()? ontap;
  final Color? bgcolor;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return ListTile(
      onTap: ontap,
      minLeadingWidth: 10,
      contentPadding: const EdgeInsets.all(0),
      leading: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              color: bgcolor!.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15)),
          child: Center(
              child: Icon(
            icon,
            size: 15,
            color: bgcolor,
          ))),
      title: Text(
        title!,
        style: theme.textTheme.bodyText1!
            .copyWith(fontWeight: FontWeight.bold, height: 1.3),
      ),
      subtitle: Text(
        date!,
        style: (date == "")
            ? theme.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold)
            : theme.textTheme.bodySmall!.copyWith(
                color: isDarkMode ? Colors.white : Colors.grey,
                fontWeight: FontWeight.bold),
      ),
      trailing: Text(
        amount!,
        style: theme.textTheme.bodyText1!
            .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      iconColor: theme.primaryColor,
    );
  }
}

class BonusListTile extends StatelessWidget {
  const BonusListTile({
    Key? key,
    @required this.title,
    this.icon,
    this.ontap,
    this.bgcolor,
    @required this.amount,
    @required this.date,
  }) : super(key: key);

  final String? title;
  final String? amount;
  final String? date;
  final IconData? icon;
  final Function()? ontap;
  final Color? bgcolor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      onTap: ontap,
      minLeadingWidth: 10,
      contentPadding: const EdgeInsets.all(0),
      leading: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              color: bgcolor, borderRadius: BorderRadius.circular(15)),
          child: Center(
              child: Icon(
            icon,
            size: 15,
            color: Colors.white,
          ))),
      title: Text(title!,
          style: theme.textTheme.bodyText1!.copyWith(
            fontSize: 16,
          )),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            amount!,
            style: theme.textTheme.bodyText1!
                .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            date!,
            style: theme.textTheme.bodySmall!,
          ),
        ],
      ),
      iconColor: theme.primaryColor,
    );
  }
}

class SettingListTile extends StatelessWidget {
  const SettingListTile({
    Key? key,
    required this.theme,
    this.leading,
    this.verify = false,
    this.isNew = false,
    this.logout = false,
    this.ontap,
  }) : super(key: key);

  final ThemeData theme;
  final String? leading;
  final bool verify;
  final bool isNew;
  final bool logout;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return ListTile(
      onTap: ontap,
      contentPadding: EdgeInsets.zero,
      leading: SizedBox(
        width: SizeConfig.sW! * 50,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              leading!,
              style: theme.textTheme.bodyText1!.copyWith(
                color: logout
                    ? const Color(0xFFDD8193)
                    : theme.textTheme.bodyText1!.color,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            isNew
                ? Container(
                    padding: const EdgeInsets.only(
                      left: 2,
                      right: 2,
                      top: 2,
                      bottom: 2,
                    ),
                    height: 18,
                    decoration: BoxDecoration(
                      color: theme.primaryColor,
                    ),
                    child: Text(
                      "New",
                      style: theme.textTheme.bodySmall!.copyWith(
                          color: isDarkMode
                              ? Colors.white
                              : theme.scaffoldBackgroundColor),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
      trailing: SizedBox(
        width: SizeConfig.sW! * 30,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            verify
                ? Container(
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                      top: 5,
                      bottom: 5,
                    ),
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFF34A853),
                    ),
                    child: Text(
                      "Verified",
                      style: theme.textTheme.bodyText1!.copyWith(
                          color: isDarkMode
                              ? Colors.white
                              : theme.scaffoldBackgroundColor),
                    ),
                  )
                : const SizedBox(),
            Icon(
              FontAwesomeIcons.angleRight,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}

class RemittancesTextFieldWithCountry extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const RemittancesTextFieldWithCountry({
    Key? key,
    this.text,
    this.ontap,
    this.iso,
    this.icon = true,
  });

  final String? text;
  final Function()? ontap;
  final String? iso;
  final bool? icon;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    Widget getCountryFlag(double height, double width) {
      return Image.asset(
        CountryPickerUtils.getFlagImageAssetPath(iso!),
        height: height,
        width: width,
        fit: BoxFit.fill,
        package: "country_pickers",
      );
    }

    SizeConfig().init(context);
    final theme = Theme.of(context);
    return Container(
      height: 45.0,
      decoration: BoxDecoration(
        color: isDarkMode
            ? theme.scaffoldBackgroundColor
            : const Color(0xFFF8F7FE),
      ),
      child: InkWell(
        onTap: ontap,
        child: Card(
          color: isDarkMode
              ? theme.scaffoldBackgroundColor
              : const Color(0xFFF8F7FE),
          margin: const EdgeInsets.only(top: 0),
          elevation: 0,
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: const BorderSide(
              width: 1.5,
              color: Color(0xFFECEBEF),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Container(
                  padding: const EdgeInsets.only(left: 12),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        bottomLeft: Radius.circular(8.0)),
                  ),
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: 45.0,
                  child: Row(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(3),
                        child: getCountryFlag(
                            SizeConfig.sW! * 5.5, SizeConfig.sW! * 7.5),
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      icon! ? Text(iso!) : const Text("200.00"),
                    ],
                  ),
                ),
              ),
              const Expanded(
                flex: 7,
                child: SizedBox(),
              ),
              icon!
                  ? const Expanded(
                      flex: 2,
                      child: Center(child: Icon(Icons.arrow_drop_down)),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Center(
                        child: Text(
                          iso!,
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

class CustProgressBar extends StatelessWidget {
  const CustProgressBar({
    Key? key,
    required this.theme,
    this.value,
  }) : super(key: key);

  final ThemeData theme;
  final double? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: const Color(0xFFF1EBF7),
      ),
      child: Stack(
        children: [
          Container(
            height: 6,
            width: SizeConfig.sW! * value!,
            decoration: BoxDecoration(
                color: theme.primaryColor,
                borderRadius: BorderRadius.circular(3)),
          ),
        ],
      ),
    );
  }
}

class RoundCustTextFieldWithIcon extends StatelessWidget {
  const RoundCustTextFieldWithIcon({
    Key? key,
    required TextEditingController? controller,
    required this.theme,
    this.text,
    this.validate,
    this.onchanged,
    this.border = false,
    this.obscure = false,
    this.textInputType = TextInputType.text,
    this.icon,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController? _controller;
  final ThemeData theme;
  final String? text;
  final bool? border;
  final bool? obscure;
  final String? Function(String?)? validate;
  final Function(String)? onchanged;
  final TextInputType textInputType;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 10, right: 10),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12.0)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12.0)),
        fillColor: Colors.white,
        filled: true,
        hintText: text!,
        hintStyle: const TextStyle(
          fontSize: 15.0,
          color: Color(0xFF757575),
        ),
        prefixIconColor: Colors.black,
        labelStyle: const TextStyle(
          fontSize: 12.0,
          color: Color(0xFF757575),
        ),
        focusColor: Colors.black,
        alignLabelWithHint: true,
        label: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            text!,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade500,
            ),
          ),
        ),
        prefixIcon: Icon(
          icon,
          color: Colors.black,
        ),
        enabled: true,
      ),
      keyboardType: TextInputType.phone,
      cursorColor: Colors.black,
      textAlign: TextAlign.start,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 18.0,
      ),
      onChanged: onchanged,
      validator: validate,
    );
  }
}
