import 'package:aldo_shop/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:aldo_shop/models/user_models.dart';

class AuthProvider with ChangeNotifier {
  late UserModel _user;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register({
    String? name,
    String? username,
    String? email,
    String? password,
  }) async {
    try {
      UserModel user = await AuthService().register(
          name: name, username: username, email: email, password: password);

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
