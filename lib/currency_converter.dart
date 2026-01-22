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
    bool withoutRounding = false,
  }) async {
    double value = 0.0;
    try {
      String url =
          "${ApiService.ENDPOINT}${from == Currency.turkisL ? 'try' : from == Currency.inchNetwork ? '1inch' : from.name}.json";

      /// get the latest currency rate
      Response? resp = (await ApiService.getConvertedAmount(url));
      if (resp != null) {
        double unitValue =
            double.parse(jsonDecode(resp.body)[from == Currency.turkisL
                    ? 'try'
                    : from == Currency.inchNetwork
                        ? '1inch'
                        : from.name][to.name]
                .toString());
        value = amount * unitValue;
      }
      if (withoutRounding) {
        return double.parse(value.toString());
      }
      return double.parse(value.toStringAsFixed(2));
    } catch (err) {
      String fallbackUrl =
          "${ApiService.FALL_BACK_URL}${from == Currency.turkisL ? 'try' : from == Currency.inchNetwork ? '1inch' : from.name}.json";
      Response? resp = (await ApiService.getConvertedAmount(fallbackUrl));
      if (resp != null) {
        double unitValue =
            double.parse(jsonDecode(resp.body)[from == Currency.turkisL
                    ? 'try'
                    : from == Currency.inchNetwork
                        ? '1inch'
                        : from.name][to.name]
                .toString());
        value = amount * unitValue;
        if (withoutRounding) {
          return double.parse(value.toString());
        }
        return double.parse(value.toStringAsFixed(2));
      } else {
        if (kDebugMode) {
          print("convert err $err");
        }
        return null;
      }
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
