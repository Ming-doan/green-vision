import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const baseUrl = 'http://172.16.255.206:5000/api';
const Map<String, String> headers = {
  'Content-Type': 'application/json',
};

class ApiHelper {
  // Get
  static Future<http.Response> get(String url) async {
    final response =
        await http.get(Uri.parse('$baseUrl/$url'), headers: headers);
    try {
      return response;
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e);
    }
  }

  // Post
  static Future<http.Response> post(String url, dynamic body) async {
    final response = await http.post(Uri.parse('$baseUrl/$url'),
        body: jsonEncode(body), headers: headers);
    try {
      return response;
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e);
    }
  }

  // Put
  static Future<http.Response> put(String url, dynamic body) async {
    final response = await http.put(Uri.parse('$baseUrl/$url'),
        body: jsonEncode(body), headers: headers);
    try {
      return response;
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e);
    }
  }

  // Delete
  static Future<http.Response> delete(String url) async {
    final response =
        await http.delete(Uri.parse('$baseUrl/$url'), headers: headers);
    try {
      return response;
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e);
    }
  }
}
