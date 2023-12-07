import 'dart:convert';
import 'package:http/http.dart' as http;
import 'user.dart';

class ApiService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  static Future<List<User>> getUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/users'));
    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return list.map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  static Future<List<Post>> getPostsByUser(int userId) async {
    final response = await http.get(Uri.parse('$baseUrl/posts?userId=$userId'));
    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);
      return list.map((post) => Post.fromJson(post)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}