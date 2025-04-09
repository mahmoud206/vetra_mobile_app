import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  static const String baseUrl = 'https://vetratech-mobile-api.onrender.com';

  static Future<dynamic> fetchData(String endpoint, Map<String, dynamic> queryParams) async {
    final response = await http.get(
      Uri.parse('$baseUrl/$endpoint').replace(queryParameters: queryParams),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<void> generateReport(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/generate-report'),
      body: json.encode(data),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to generate report');
    }
  }
}






