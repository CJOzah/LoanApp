
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:credit_direct/utilities/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreditDirectData extends ChangeNotifier {
  Country selectedCountry = CountryPickerUtils.getCountryByName('Nigeria');

  String? payment;
  String? bankName;
  String? narration;
  String? amount;
  String? accountNumber;
  String? provider;
  String? phoneNumber;


  // ignore: non_constant_identifier_names
  CountryData() {
    selectedCountry;
  }

  void setCountry(Country country) {
    selectedCountry = country;
    notifyListeners();
  }

  Country getCountry() {
    return selectedCountry;
  }

  String getPhoneCode() {
    return selectedCountry.phoneCode.toString();
  }

  String getIso() {
    return selectedCountry.isoCode;
  }

  String getIso3() {
    return selectedCountry.iso3Code;
  }

  Widget getCountryName() {
    return Text(selectedCountry.name);
  }

//for the transfer screens
  void setFundWalletDetails(
      {String? payment,
      String? bankName,
      String? narration,
      String? amount,
      String? accountNumber}) {
    this.accountNumber = accountNumber;
    this.narration = narration;
    this.bankName = bankName;
    this.amount = amount;
    this.payment = payment;
  }

  Map<String, dynamic> getfundWalletDetails() {
    return {
      "paymentSource": payment,
      "bankName": bankName,
      "narration": narration,
      "amount": amount,
      "accountNumber": accountNumber
    };
  }


  //for paybills screen
  void setPayBillsDetails(
      {String? payment,
      String? provider,
      String? amount,
      String? phoneNumber}) {
    this.phoneNumber = phoneNumber;
    this.provider = provider;
    this.amount = amount;
    this.payment = payment;
  }

  Map<String, dynamic> getPayBillsDetails() {
    return {
      "paymentSource": payment,
      "provider": provider,
      "amount": amount,
      "phoneNumber": phoneNumber
    };
  }

  Widget _buildDialogItem(Country country) => Row(
        children: <Widget>[
          const SizedBox(width: 8.0),
          Flexible(
              child: Padding(
            padding: const EdgeInsets.only(left: 2.0, right: 2.0, bottom: 8.0),
            child: Text(
              country.name,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
            ),
          ))
        ],
      );

  void openCountryPickerDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) => Container(
          color: Colors.white.withOpacity(0.70),
          child: Theme(
            data: Theme.of(context)
                .copyWith(primaryColor: Theme.of(context).primaryColor),
            child: CountryPickerDialog(
              contentPadding:
                  const EdgeInsets.only(bottom: 30.0, left: 0.0, right: 0.0),
              searchCursorColor: Theme.of(context).primaryColor,
              searchInputDecoration: const InputDecoration(
                hintText: 'Search...',
              ),
              isSearchable: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Tap to change country',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      HorizontalLine(
                        width: 160.0,
                        height: 2.5,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                  IconsButton(
                    icon: Icons.close,
                    color: Colors.black,
                    function: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              onValuePicked: (Country country) {
                selectedCountry = country;
                Provider.of<CreditDirectData>(context, listen: false)
                    .setCountry(selectedCountry);
              },
              itemBuilder: _buildDialogItem,
              priorityList: [
                CountryPickerUtils.getCountryByIsoCode('NG'),
                CountryPickerUtils.getCountryByIsoCode('SA'),
              ],
            ),
          ),
        ),
      );
}
