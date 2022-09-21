library currency_converter;

import 'dart:async';
import 'dart:convert';

import 'package:currency_converter/api_service.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

/// [CurrencyConverter] Convert currency from one currency to another currency
/// [convert] It will call the api to server and get the latest currency rate and return the amount

class CurrencyConverter {
  static Future<double?> convert({
    required String from,
    required String to,
    required double amount,
  }) async {
    try {
      String url = "${ApiService.ENDPOINT}$from/$to.json";
      double value = 0.0;

      /// get the latest currency rate
      Response? resp = (await ApiService.getConvertedAmount(url));
      if (resp != null) {
        double unitValue = double.parse(jsonDecode(resp.body)[to].toString());
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
}
