import 'package:flutter/material.dart';

import 'package:login_google/res/custom_colors.dart';

class AppBarTitle extends StatelessWidget {
  final String sectionName;

  const AppBarTitle({
    Key? key,
    required this.sectionName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/firebase_logo.png',
          height: 20,
        ),
        SizedBox(width: 8),
        Text(
          'Login com Google',
          style: TextStyle(
            color: CustomColors.firebaseYellow,
            fontSize: 18,
          ),
        ),
        Text(
          ' $sectionName',
          style: TextStyle(
            color: CustomColors.firebaseOrange,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
