import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      "https://stage-ncomfort.b4production.com/api";

  Future<Map<String, dynamic>> getFashionData() async {
    final url = Uri.parse("$baseUrl/fashion");

    print("Requesting: $url");

    try {
      final response = await http
          .post(
            url,
            headers: {
              "Content-Type": "application/json",
              "Accept": "application/json",
            },
            body: jsonEncode({}),
          )
          .timeout(const Duration(seconds: 10));

      print("Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception("Server error: ${response.statusCode}");
      }

    } on SocketException {
      throw SocketException("No internet");
    } on TimeoutException {
      throw TimeoutException("Request timeout");
    }
  }
}