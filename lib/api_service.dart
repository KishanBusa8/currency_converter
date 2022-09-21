import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class ApiService {
  // url
  static const String ENDPOINT =
      "https://cdn.jsdelivr.net/gh/fawazahmed0/currency-api@1/latest/currencies/";

// get amount function used for call api and return value
  static Future<Response?> getConvertedAmount(url) async {
    try {
//cal api
      final response = await get(Uri.parse(url));
// get response
      return response;
    } catch (e) {
// catch er
      if (kDebugMode) {
        print("fetch get err $e");
      }
    }
    return null;
  }
}
