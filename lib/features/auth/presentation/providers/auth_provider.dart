import 'package:flutter/material.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
import '../../domain/entities/user.dart';

class AuthProvider with ChangeNotifier {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final LogoutUseCase logoutUseCase;

  AuthProvider(this.loginUseCase, this.registerUseCase, this.logoutUseCase);

  User? _user;
  bool _isLoading = false;
  Map<String, String>? _pendingRegistration;

  User? get user => _user;
  bool get isLoading => _isLoading;
  Map<String, String>? get pendingRegistration => _pendingRegistration;

  void savePendingRegistration({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) {
    _pendingRegistration = {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
    };
    notifyListeners();
  }

  void clearPendingRegistration() {
    _pendingRegistration = null;
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();
    _user = await loginUseCase(email, password);
    _isLoading = false;
    notifyListeners();
  }

  Future<void> register(
    String email,
    String password,
    String firstName,
    String lastName,
  ) async {
    _isLoading = true;
    notifyListeners();
    _user = await registerUseCase(email, password, firstName, lastName);
    _isLoading = false;
    notifyListeners();
  }

  Future<void> logout() async {
    await logoutUseCase();
    _user = null;
    notifyListeners();
  }
}
