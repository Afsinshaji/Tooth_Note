import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:tooth_note/utilities/Colors.dart';

void alertSnackbar(BuildContext context, String message) {
  final snackBar = SnackBar(
    backgroundColor: ToothNoteColors.kredColor,
    content: Text(
      message,
      style: GoogleFonts.poppins(
        textStyle: const TextStyle(
          letterSpacing: .5,
          fontSize: 16,
          color: ToothNoteColors.kWhiteColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    action: SnackBarAction(
      label: 'Okay',
      textColor: ToothNoteColors.kWhiteColor,
      onPressed: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
