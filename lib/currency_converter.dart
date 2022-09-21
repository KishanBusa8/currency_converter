library currency_converter;

import 'dart:async';
import 'dart:convert';

import 'package:currency_converter/api_service.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class CurrencyConverter {
  static Future<double?> convert(
      {required String from,
      required String to,
      required double amount}) async {
    try {
      String url = "${ApiService.ENDPOINT}$from/$to.json";

      Response? resp = (await ApiService.getConvertedAmount(url));
      double value = 0;
      if (resp != null) {
        double unitValue = jsonDecode(resp.body)[to];
        value = amount * unitValue;
      }
      return value;
    } catch (err) {
      if (kDebugMode) {
        print("convert err $err");
      }
      return 0.0;
    }
  }
}
