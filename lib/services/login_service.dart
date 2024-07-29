import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class LoginService {
  login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    var url = Uri.http('localhost:3001', 'api/login');
    var response = await http.post(
      url,
      body: {"email": email, "password": password},
    );
    var res = jsonDecode(response.body);

    if (res['result']) {
      // ignore: use_build_context_synchronously
      context.go('/dashboard');
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Invalid Email or Password")));
    }
  }
}
