import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

///[ApiService] class is used for the call the api from the server
///[ENDPOINT] is the server url
///[getConvertedAmount] method will be used for converting currencies.

class ApiService {
  // url
  static const String ENDPOINT =
      "https://cdn.jsdelivr.net/npm/@fawazahmed0/currency-api@latest/v1/currencies/";
  static const String FALL_BACK_URL =
      "https://latest.currency-api.pages.dev/v1/currencies/";
// get amount function used for call api and return value
  static Future<Response?> getConvertedAmount(url) async {
    //cal api
    final response = await get(Uri.parse(url));
    // get response
    return response;
  }
}
