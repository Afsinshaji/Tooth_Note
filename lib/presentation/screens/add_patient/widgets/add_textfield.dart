import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tooth_note/presentation/screens/add_booking/widgets/time_slot.dart';

import 'package:tooth_note/utilities/colors.dart';

class AddTextField extends StatelessWidget {
  const AddTextField({
    super.key,
    required this.controller,
    required this.isTextNumberType,
    required this.text,
    required this.fieldColor,
    this.prefix,
    this.fontSize,
    this.isSex = false,
    this.isDoc = false,
    this.isToValidate = false,
    this.isSlot = false,
  });

  final TextEditingController controller;
  final bool isTextNumberType;

  final String text;
  final bool isSex;
  final bool isDoc;
  final bool isSlot;
  final bool isToValidate;
  final Color fieldColor;
  final Widget? prefix;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      child: Material(
        shadowColor: fieldColor,
        elevation: 2,
        borderRadius: BorderRadius.circular(5),
        child: TextFormField(
          onTap: () {
            if (isSex || isDoc) {
              log('ok');
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
                              isDoc ? 'Select Doctor' : 'SEX',
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
                                controller.text =
                                    isDoc ? 'Dr.Jinish S Manjaly' : 'MALE';
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
                                      isDoc ? ' Dr.Jinish S Manjaly ' : 'MALE',
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
                                controller.text =
                                    isDoc ? 'Dr.Livina Jinish' : 'FEMALE';
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
                                      isDoc ? 'Dr.Livina Jinish' : 'FEMALE',
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
            } else if (isSlot) {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                context: context,
                builder: (context) {
                  return TimeSlotBottomSheet(
                    controller: controller,
                  );
                },
              );
            }
          },
          showCursor: isSex || isDoc || isSlot ? false : true,
          readOnly: isSex || isDoc || isSlot ? true : false,
          onChanged: (value) {},
          controller: controller,
          enableSuggestions: !isTextNumberType,
          autocorrect: !isTextNumberType,
          cursorColor: fieldColor,
          style: TextStyle(
              color: ToothNoteColors.kBlackColor.withOpacity(0.9),
              fontSize: fontSize),
          decoration: InputDecoration(
              prefixIcon: prefix,
              labelText: text,
              labelStyle: TextStyle(
                  color: fieldColor.withOpacity(0.9),
                  fontSize: size.width * 0.038,
                  fontWeight: FontWeight.w500),
              filled: true,
              // floatingLabelBehavior: widget.floatingLabelBehavior,
              fillColor: ToothNoteColors.kWhiteColor,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(
                  width: 1,
                  style: BorderStyle.solid,
                  color: fieldColor,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(width: 0, style: BorderStyle.none),
              )),
          keyboardType: isSex || isDoc || isSlot
              ? TextInputType.none
              : isTextNumberType
                  ? TextInputType.number
                  : TextInputType.emailAddress,
          validator: (text) {
            // if (!isTextNumberType) {
            if (isToValidate) {
              if (text == null || text.isEmpty) {
                return "Can't be Empty";
              }
            }
            // }

            // if (isTextNumberType && text.length < 10) {
            //   return 'Enter a valid number';
            // }

            return null;
          },
        ),
      ),
    );
  }
}
