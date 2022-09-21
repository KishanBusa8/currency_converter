import 'package:http/http.dart' as http;

class ApiService {
  // url
  static const String ENDPOINT =
      "https://cdn.jsdelivr.net/gh/fawazahmed0/currency-api@1/latest/currencies/";

// get amount function used for call api and return value
  static Future<http.Response?> getConvertedAmount(url) async {
    try {
      print(url);
//cal api
      final response = await http.get(Uri.parse(url));
// get response
      return response;
    } catch (e) {
// catch er
      print("fetch get err $e");
    }
  }
}
