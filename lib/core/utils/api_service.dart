import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  ApiService._();

  static final ApiService _instance = ApiService._();

  factory ApiService() => _instance;

  final String _baseUrl = 'https://jsonplaceholder.typicode.com/';

  Future<dynamic> get({required String endpoint}) async {
    final http.Response response = await http.get(
      Uri.parse('$_baseUrl$endpoint'),
    );
    return jsonDecode(response.body);
  }
}
