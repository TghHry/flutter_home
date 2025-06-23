import 'dart:convert';
import 'package:http/http.dart' as http;

class UserModel {
  final String baseUrl = 'https://reqres.in/api/users';

  Future<Map<String, dynamic>?> createUser(String name, String job) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      body: {'name': name, 'job': job},
    );

    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      return null;
    }
  }

  Future<Map<String, dynamic>?> updateUser(int id, String name, String job) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      body: {'name': name, 'job': job},
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return null;
    }
  }

  Future<bool> deleteUser(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    return response.statusCode == 204;
  }

}
