import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constant/constants.dart';

class FriendsHeading extends StatelessWidget {
  const FriendsHeading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Text(
        'How many friends?',
        style: GoogleFonts.dancingScript(
            color: AppColors.mainColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            fontSize: 25),
      ),
    );
  }
}
