import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:tooth_note/utilities/colors.dart';

class AddNotesTextField extends StatelessWidget {
  const AddNotesTextField(
      {super.key,
      required this.controller,
      required this.maxLines,
      this.isAttended = false});

  final TextEditingController controller;
  final int? maxLines;
  final bool isAttended;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(
          // horizontal: 10.0,
          ),
      child: Material(
        shadowColor: ToothNoteColors.backgroundColor,
        elevation: 2,
        borderRadius: BorderRadius.circular(5),
        child: TextFormField(
          showCursor: !isAttended,
          readOnly: isAttended,
          keyboardType: isAttended? TextInputType.none
              :TextInputType.text,
          onTap: () {
            if (isAttended) {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Container(
                      padding: EdgeInsets.all(size.width * 0.1),
                      width: size.width * 0.3,
                      height: size.height * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: ToothNoteColors.backgroundColor,
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mark Attendance',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: size.width * 0.05,
                                  color: ToothNoteColors.kWhiteColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.text = 'Yes';
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: size.width * 0.1,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: ToothNoteColors.kWhiteColor,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Yes',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontSize: size.width * 0.05,
                                          color:
                                              ToothNoteColors.backgroundColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.text = 'No';
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: size.width * 0.1,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: ToothNoteColors.kWhiteColor,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'No',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontSize: size.width * 0.05,
                                          color:
                                              ToothNoteColors.backgroundColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ]),
                    ),
                  );
                },
              );
            }
          },
          maxLines: maxLines,
          onChanged: (value) {},
          controller: controller,
          cursorColor: ToothNoteColors.backgroundColor,
          style: TextStyle(
            color: ToothNoteColors.kBlackColor.withOpacity(0.9),
            // fontSize: fontSize
          ),
          decoration: InputDecoration(
            hintText: isAttended?'Yes/No':null,
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
