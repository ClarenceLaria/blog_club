import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://192.168.1.111:3000"; // Change to your API URL in production

  // ✅ Fetch Posts
  static Future<List<dynamic>> getPosts() async {
    final response = await http.get(Uri.parse("$baseUrl/posts"));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load posts");
    }
  }

  // ✅ Create a Post
  static Future<void> createPost(Map<String, dynamic> postData) async {
    final response = await http.post(
      Uri.parse("$baseUrl/write"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(postData),
    );

    if (response.statusCode != 201) {
      throw Exception("Failed to create post");
    }
  }
}
