import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:tooth_note/utilities/colors.dart';

alertBox(BuildContext context, String message, Function() onTap,Size size) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: ToothNoteColors.kredColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      title: Text(
        message,
        style: GoogleFonts.poppins(
          textStyle: const TextStyle(
            letterSpacing: .5,
            fontSize: 22,
            color: ToothNoteColors.kWhiteColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      content: Text(
        'Are You Sure?',
        style: GoogleFonts.poppins(
          textStyle: const TextStyle(
            letterSpacing: .5,
            fontSize: 18,
            color: ToothNoteColors.kWhiteColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
                onPressed: onTap,
                child: Text(
                  'Yes',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      letterSpacing: .5,
                      fontSize: 14,
                      color: ToothNoteColors.kBlackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )),
                SizedBox(
                  width:size.width*0.01 ,
                ),
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'No',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      letterSpacing: .5,
                      fontSize: 16,
                      color: ToothNoteColors.kWhiteColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ))
          ],
        )
      ],
    ),
  );
}