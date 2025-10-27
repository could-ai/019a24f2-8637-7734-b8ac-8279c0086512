import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/device.dart';
import '../utils/mock_data.dart';
import '../integrations/supabase.dart';

class AuthProvider with ChangeNotifier {
  Map<String, dynamic>? _user;
  bool _isAuthenticated = false;

  Map<String, dynamic>? get user => _user;
  bool get isAuthenticated => _isAuthenticated;

  Future<bool> signIn(String email, String password) async {
    // Mock Supabase auth
    await Future.delayed(const Duration(seconds: 1));
    if (email == 'test@example.com' && password == 'password') {
      _user = {'name': 'Test User', 'email': email};
      _isAuthenticated = true;
      notifyListeners();
      return true;
    }
    return false;
  }

  void signOut() {
    _user = null;
    _isAuthenticated = false;
    notifyListeners();
  }

  // TODO: Integrate with Supabase Auth
}