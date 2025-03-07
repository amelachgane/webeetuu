import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'api_constants.dart';

class ApiService {
  static final Dio dio = Dio();
  static final FlutterSecureStorage storage = FlutterSecureStorage();

  //  log in and store the token
  static Future<bool> login(String username, String password) async {
    try {
      final response = await dio.post(
        ApiConstants.login,
        data: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        String token = response.data['token'];
        await storage.write(key: "jwt_token", value: token); // Store token
        return true;
      }
    } catch (e) {
      print("Login failed: $e");
    }
    return false;
  }

  //teacher's schedule
  static Future<List<dynamic>> fetchSchedule() async {
    try {
      // Retrieve token from secure storage
      String? token = await storage.read(key: "jwt_token");
      if (token == null) throw Exception("No token found, please log in.");

      final response = await dio.get(
        ApiConstants.getSchedule,
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception("Failed to load schedule.");
      }
    } catch (e) {
      print("Error fetching schedule: $e");
      return [];
    }
  }
}
