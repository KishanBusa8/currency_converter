import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

///[ApiService] class is used for the call the api from the server
///[ENDPOINT] is the server url
///[getConvertedAmount] method will be used for converting currencies.

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
