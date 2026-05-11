import 'package:flutter/material.dart';

class MyAccountBody1 extends StatelessWidget {
  const MyAccountBody1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/features/my_account/images/body_1_bg.png"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300, width: 1.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/features/my_account/icons/download.png",
                ),
                SizedBox(width: 8),
                Text(
                  "Download Report",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
