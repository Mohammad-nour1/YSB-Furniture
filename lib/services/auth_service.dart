import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/login_model.dart';
import '../models/user_model.dart';

class AuthService {
  final String baseUrl = 'https://furniture-api.mastercoders.dev/api';

  Future<bool> login(LoginModel loginModel) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(loginModel.toJson()),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error logging in: $e');
      return false;
    }
  }

  Future<bool> signUp(UserModel user) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(user.toJson()),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error signing up: $e');
      return false;
    }
  }
}
