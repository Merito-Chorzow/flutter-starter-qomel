import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String samplePostUrl =
      'https://jsonplaceholder.typicode.com/posts/1';

  static Future<Map<String, dynamic>> fetchSamplePost(int id) async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts/$id');
    final resp = await http.get(url);
    if (resp.statusCode == 200) {
      return jsonDecode(resp.body) as Map<String, dynamic>;
    }
    throw Exception('Nie udany załadowanie: ${resp.statusCode}');
  }
}
