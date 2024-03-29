import 'package:flutter/material.dart';

import 'package:tooth_note/utilities/colors.dart';

class AddNotesTextField extends StatelessWidget {
  const AddNotesTextField({
    super.key,
    required this.controller,required this.maxLines
  });

  final TextEditingController controller;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(
        // horizontal: 10.0,
      ),
      child: Material(
        shadowColor: ToothNoteColors.backgroundColor,
        elevation: 2,
        borderRadius: BorderRadius.circular(5),
        child: TextFormField(
          maxLines: maxLines,
          onChanged: (value) {},
          controller: controller,
          cursorColor: ToothNoteColors.backgroundColor,
          style: TextStyle(
            color: ToothNoteColors.kBlackColor.withOpacity(0.9),
            // fontSize: fontSize
          ),
          decoration: InputDecoration(
              filled: true,
              // floatingLabelBehavior: widget.floatingLabelBehavior,
              fillColor: ToothNoteColors.kWhiteColor,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(
                  width: 1,
                  style: BorderStyle.solid,
                  color: ToothNoteColors.backgroundColor,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(width: 0, style: BorderStyle.none),
              )),
          validator: (text) {
            if (text == null || text.isEmpty) {
              return "Can't be Empty";
            }

            return null;
          },
        ),
      ),
    );
  }
}
