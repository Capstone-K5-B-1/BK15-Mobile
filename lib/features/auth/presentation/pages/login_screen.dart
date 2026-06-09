import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:b1k5_mobile/shared/widgets/button/custom_button.dart';
import 'package:b1k5_mobile/shared/widgets/button/input_field.dart';
import 'package:b1k5_mobile/shared/widgets/button/navbar.dart';
import 'package:b1k5_mobile/core/services/api_services.dart';
import 'package:b1k5_mobile/repositories/auth_repository.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userIdController = TextEditingController();
  final AuthRepository _authRepository = AuthRepository(ApiService());
  bool _isLoading = false;

  @override
  void dispose() {
    _userIdController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    final userId = _userIdController.text.trim();
    if (userId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your User ID'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      await _authRepository.login(userId);
      if (mounted) {
        context.go('/MainNavbar');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString().replaceAll('Exception:', '').trim()),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: const Color(0xFF6E1312)),
          Positioned(
            bottom: 12,
            right: 24,
            child: Image.asset(
              "assets/features/auth/images/texture_login_2.png",
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              "assets/features/auth/images/texture_login_1.png",
            ),
          ),
          Positioned(
            bottom: 124, // Tarik sedikit ke atas layar agar abstrak
            left: 48, // Tarik sedikit ke kanan layar
            child: Container(
              width: 50, // Ukuran diameter lingkaran
              height: 50,
              decoration: BoxDecoration(
                color: Colors.transparent, // Latar belakang transparan
                shape: BoxShape.circle, // Membuat Container jadi lingkaran
                border: Border.all(
                  color: Color(0xFFF56564),
                  width: 1.0, // Keteba lan outline tipis
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 148, // Tarik sedikit ke atas layar agar abstrak
            left: 116, // Tarik sedikit ke kanan layar
            child: Container(
              width: 40, // Panjang garis
              height: 1,
              decoration: BoxDecoration(
                color: const Color(
                  0xFFF56564,
                ), // Warna yang sama dengan circle sebelumnya
                // Memberikan sedikit radius di ujung garis agar tidak tajam
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Positioned.fill(
                child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 60, 24, 48),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 36, // Ukuran lebar kotak
                                  height: 36,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(
                                      0.2,
                                    ), // Hanya untuk arrow
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    iconSize: 28,
                                    icon: Icon(
                                      LucideIcons.chevronLeft,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(bottom: 4),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.white,
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 36, // Ukuran lebar kotak
                                  height: 36,
                                  decoration: BoxDecoration(
                                    color:
                                        Colors.transparent, // Hanya untuk arrow
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    iconSize: 28,
                                    icon: Icon(
                                      LucideIcons.helpCircle,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const SizedBox(height: 64),
                                  CustomInputField(
                                    controller: _userIdController,
                                    hintText: 'Enter user ID',
                                    isPassword: true,
                                    suffixActionText: 'Forgot user ID?',
                                    onSuffixActionTap: () {
                                      print("Forgot user ID ditekan");
                                    },
                                  ),
                                  const SizedBox(height: 36),

                                  CustomButton(
                                    text: _isLoading ? 'Logging in...' : 'Login',
                                    backgroundColor: Colors.white,
                                    textColor: const Color(0xFF6E1312),
                                    fontWeight: FontWeight.w500,
                                    borderRadius: 24,
                                    onPressed: _isLoading ? () {} : _handleLogin,
                                  ),
                                  const SizedBox(height: 40),
                                  Text(
                                    "I have an account but no user ID",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(height: 20),

                                  CustomButton(
                                    text: 'Register to OCTO',
                                    backgroundColor: Colors.transparent,
                                    textColor: Colors.white,
                                    borderColor: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    borderRadius: 24,
                                    onPressed: () {
                                      print("Tombol Register ditekan");
                                    },
                                  ),
                                  const SizedBox(height: 40),
                                  const Text(
                                    "I don't have any account",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  GestureDetector(
                                    onTap: () {
                                      print("Open an account now ditekian");
                                    },
                                    child: const Text(
                                      "Open an account now",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight:
                                            FontWeight
                                                .w600, // Sedikit lebih tebal menandakan bisa diklik
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Center(
                          child: IntrinsicWidth(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Image.asset(
                                  "assets/features/splash/images/octo_text.png",
                                  width: 110,
                                ),
                                Image.asset(
                                  "assets/features/splash/images/by_cimb_niaga_text.png",
                                  width: 76,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
              ],
            ),
          ),
        ],
      );
  }
}
