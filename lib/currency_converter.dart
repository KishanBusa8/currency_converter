library currency_converter;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:currency_converter/api_service.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

import 'currency.dart';

/// [CurrencyConverter] Convert currency from one currency to another currency
/// [convert] It will call the api to server and get the latest currency rate and return the amount
/// [getMyCurrency] this function will return the your local currency.

class CurrencyConverter {
  static Future<double?> convert({
    required Currency from,
    required Currency to,
    required double amount,
  }) async {
    try {
      String url = "${ApiService.ENDPOINT}${from.name}/${to.name}.json";
      double value = 0.0;

      /// get the latest currency rate
      Response? resp = (await ApiService.getConvertedAmount(url));
      if (resp != null) {
        double unitValue = double.parse(jsonDecode(resp.body)[to.name].toString());
        value = amount * unitValue;
      }
      return double.parse(value.toStringAsFixed(2));
    } catch (err) {
      if (kDebugMode) {
        print("convert err $err");
      }
      return 0.0;
    }
  }

  static Future<Currency> getMyCurrency() async {
    Currency myCurrency = Currency.usd;
    var format = NumberFormat.simpleCurrency(locale: Platform.localeName);
    for (var element in Currency.values) {
      if (element.name == format.currencyName?.toLowerCase()) {
        myCurrency = element;
      }
    }
    return myCurrency;
  }
}
