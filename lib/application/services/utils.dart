// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:octagon_africa/application/services/asset_strings.dart';
import 'package:octagon_africa/domain/value_objects/constants.dart';
import 'package:octagon_africa/domain/value_objects/enums.dart';

/// [isValidPhoneNumber] checks if a number is either a [Kenyan] , [American],  [UK] or [Belgium] phone number
bool isValidPhoneNumber(String phone) {
  if (kenyanPhoneRegExp.hasMatch(phone) ||
      (americanPhoneRegExp.hasMatch(phone)) ||
      (unitedKingdomRegExp.hasMatch(phone)) ||
      (genericInternationalRegExp.hasMatch(phone))) {
    return true;
  } else {
    return false;
  }
}

String? userPinValidator(dynamic val) {
  final String value = val as String;
  if (value.isEmpty) {
    return 'Password is required';
  }

  if (value.length < 5) {
    return 'Password should be more than 4 characters';
  }
  return null;
}

String? userEmailValidator(dynamic val) {
  final String value = val as String;
  if (value.isEmpty) {
    return 'Email is required';
  }

  if (!RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
  ).hasMatch(value)) {
    return 'Enter a valid Email';
  }
  return null;
}

String? nameValidator(dynamic val) {
  final String value = val as String;
  if (value.isEmpty) {
    return 'Field is required';
  }
  return null;
}

Map<String, Map<String, String>> supportedCountries =
    <String, Map<String, String>>{
  'kenya': <String, String>{
    'code': '+254',
    'initial': 'KE',
    'name': 'Kenya',
    'flag': kenyaFlagPngPath,
  },
  'uganda': <String, String>{
    'code': '+255',
    'initial': 'UG',
    'name': 'Uganda',
    'flag': ugandaFlagPngPath,
  },
  'tanzania': <String, String>{
    'code': '+256',
    'initial': 'TZ',
    'name': 'Tanzania',
    'flag': tanzaniaFlagPngPath,
  },
  'usa': <String, String>{
    'code': '+1',
    'initial': 'USA',
    'name': 'United States',
    'flag': usaFlagPngPath,
  },
  'uk': <String, String>{
    'code': '+44',
    'initial': 'UK',
    'name': 'United Kingdom',
    'flag': ukFlagPngPath,
  },
  'belgium': <String, String>{
    'code': '+32',
    'initial': 'BEL',
    'name': 'Belgium',
    'flag': belgiumFlagPngPath,
  },
  'nigeria': <String, String>{
    'code': '+234',
    'initial': 'NG',
    'name': 'Nigeria',
    'flag': nigeriaFlagPngPath,
  },
};

Future<Country?> selectCountryModalBottomSheet(BuildContext context) {
  return showModalBottomSheet<Country>(
    context: context,
    builder: (_) {
      return SizedBox(
        child: Wrap(
          children: <Widget>[
            for (Map<String, String> country in supportedCountries.values)
              ListTile(
                leading: Image.asset(
                  country['flag']!,
                  height: 25,
                ),
                title: Text(country['name']!),
                onTap: () {
                  Navigator.of(context).pop(popValue(country['name']!));
                },
              ),
          ],
        ),
      );
    },
  );
}

Country popValue(String name) {
  switch (name) {
    case 'Kenya':
      return Country.kenya;
    case 'Uganda':
      return Country.uganda;
    case 'Tanzania':
      return Country.tanzania;
    case 'Belgium':
      return Country.belgium;
    case 'United Kingdom':
      return Country.uk;
    case 'Nigeria':
      return Country.nigeria;
    default:
      return Country.us;
  }
}

Map<String, String>? getCountry(Country country) {
  switch (country) {
    case Country.kenya:
      return supportedCountries['kenya'];
    case Country.uganda:
      return supportedCountries['uganda'];
    case Country.tanzania:
      return supportedCountries['tanzania'];
    case Country.belgium:
      return supportedCountries['belgium'];
    case Country.uk:
      return supportedCountries['uk'];
    case Country.nigeria:
      return supportedCountries['nigeria'];
    default:
      return supportedCountries['usa'];
  }
}

String formatPhoneNumber({
  required String countryCode,
  required String phoneNumber,
}) {
  final String _countryCode =
      !countryCode.startsWith('+') ? '+$countryCode' : countryCode;

  if (_countryCode == '+1') {
    return '$countryCode$phoneNumber';
  }

  final String _phoneNumber =
      phoneNumber.startsWith('0') ? phoneNumber.substring(1) : phoneNumber;

  return '$_countryCode$_phoneNumber';
}

String formatDate() {
  final DateTime parsedDate = DateTime.now();
  final String postDay = DateFormat.d().format(parsedDate);

  final String postMonth = DateFormat.MMMM().format(parsedDate);
  return '$postMonth $postDay';
}
