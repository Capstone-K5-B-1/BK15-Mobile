import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:b1k5_mobile/shared/widgets/button/custom_button.dart';
import 'package:b1k5_mobile/shared/widgets/button/input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF6E1312),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(24, 60, 24, 48),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          bottom: BorderSide(color: Colors.white, width: 2.0),
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
                        color: Colors.transparent, // Hanya untuk arrow
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        iconSize: 28,
                        icon: Icon(LucideIcons.helpCircle, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 64),
                            CustomInputField(
                              hintText: 'Enter user ID',
                              isPassword: true,
                              suffixActionText: 'Forgot user ID?',
                              onSuffixActionTap: () {
                                print("Forgot user ID ditekan");
                              },
                            ),
                            const SizedBox(height: 48),

                            CustomButton(
                              text: 'Login',
                              backgroundColor: Colors.white,
                              textColor: const Color(0xFF6E1312),
                              fontWeight: FontWeight.w500,
                              borderRadius: 24,
                              onPressed: () {
                                print("Tombol Login ditekian");
                              },
                            ),
                            const SizedBox(height: 48),
                            Text(
                              "I have an account but no user ID",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 24),

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
                            const SizedBox(height: 48),
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
                      Center(
                        child: IntrinsicWidth(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment:
                                CrossAxisAlignment
                                    .end, // Agar teks cimbs rata kanan terhadap gambar octo
                            children: [
                              Image.asset(
                                "assets/features/splash/images/octo_text.png",
                                width: 110,
                                // Silakan sesuaikan lebar gambar utama
                              ),
                              Image.asset(
                                "assets/features/splash/images/by_cimb_niaga_text.png",
                                width:
                                    76, // Silakan sesuaikan lebar gambar tulisan cimb
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
