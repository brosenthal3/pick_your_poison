import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  Future<Map<String, dynamic>> fetchMushroomData(Map<String, dynamic> mushroomFeatures) async {
    final response = await http.post(
      Uri.parse('$baseUrl/predict'),
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: json.encode(mushroomFeatures),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load data');
    }
  }
}