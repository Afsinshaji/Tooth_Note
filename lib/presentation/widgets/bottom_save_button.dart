import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tooth_note/utilities/colors.dart';

class BottomSaveButton extends StatelessWidget {
  const BottomSaveButton({
    super.key,
    required this.formKey,
    required this.size,
    required this.onTap,this.text='Save'
  });

  final GlobalKey<FormState> formKey;
  final Size size;
  final Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: size.width * 0.015, horizontal: size.width * 0.01),
        height: size.height * 0.075,
        width: size.width,
        decoration: BoxDecoration(
            color: ToothNoteColors.backgroundColor,
            borderRadius: BorderRadius.circular(15)),
        child: Center(
            child: Text(
         text,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              letterSpacing: .5,
              fontSize: size.width * 0.04,
              color: ToothNoteColors.kWhiteColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        )),
      ),
    );
  }
}
