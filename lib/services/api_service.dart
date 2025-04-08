import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/sales_report.dart';
import '../models/clinic_report.dart';
import '../models/payment_report.dart';

class ApiService {
  static const String _baseUrl = 'https://vetratech-mobile-api.onrender.com';

  Future<Map<String, dynamic>> fetchFullReport({
    required String dbName,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/full-report'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'db_option': dbName,
        'start_date': startDate.toIso8601String(),
        'end_date': endDate.toIso8601String(),
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load report: ${response.statusCode}');
    }
  }

  Future<String> downloadPdf(Map<String, dynamic> reportData) async {
    return reportData['pdf_bytes'] as String;
  }
}