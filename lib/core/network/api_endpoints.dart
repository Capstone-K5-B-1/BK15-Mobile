abstract class ApiEndpoints {
  // Base
  static const String baseUrl = '/api';

  // Authentication
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String logout = '/auth/logout';
  static const String refreshToken = '/auth/refresh';
  static const String forgotPassword = '/auth/forgot-password';
  static const String resetPassword = '/auth/reset-password';

  // User
  static const String profile = '/users/profile';
  static const String users = '/users';
  static const String updateProfile = '/users/profile';
  static const String changePassword = '/users/change-password';

  // Health
  static const String health = '/health';
  static const String test = '/test';
}
