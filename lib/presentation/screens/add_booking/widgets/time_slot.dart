import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tooth_note/presentation/view_states/add_booking.dart/riverpod_add_booking.dart';
import 'package:tooth_note/presentation/view_states/home/riverpod_home.dart';
import 'package:tooth_note/utilities/colors.dart';

class TimeSlotBottomSheet extends ConsumerWidget {
  const TimeSlotBottomSheet( {super.key,required this.controller,});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.6,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            Text(
              'Select Time Slot',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: size.width * 0.05,
                  color: ToothNoteColors.kBlackColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Column(
              children: List.generate(
                  24,
                  (index) => Column(
                        children: [
                          SortTimeTile(
                            onTap: () {
                              controller.text = getTimeSlot(index);
                              addTimeSlot(getTimeSlot(index), ref);
                              Navigator.pop(context);
                            },
                            title: getTimeSlot(index),
                            subTitle: '',
                          ),
                        ],
                      )),
            ),
          ],
        ),
      ),
    );
  }
}

String getTimeSlot(int index) {
  final timeSlotList = [
    '09:00 - 09:30 A.M',
    '09:30 - 10:00 A.M',
    '10:00 - 10:30 A.M',
    '10:30 - 11:00 A.M',
    '11:00 - 11:30 A.M',
    '11:30 - 12:00 P.M',
    '12:00 - 12:30 P.M',
    '12:30 - 01:00 P.M',
    '01:00 - 01:30 P.M',
    '01:30 - 02:00 P.M',
    '02:00 - 02:30 P.M',
    '02:30 - 03:00 P.M',
    '03:00 - 03:30 P.M',
    '03:30 - 04:00 P.M',
    '04:00 - 04:30 P.M',
    '04:30 - 05:00 P.M',
    '05:00 - 05:30 P.M',
    '05:30 - 06:00 P.M',
    '06:00 - 06:30 P.M',
    '06:30 - 07:00 P.M',
    '07:00 - 07:30 P.M',
    '07:30 - 08:00 P.M',
    '08:00 - 08:30 P.M',
    '08:30 - 09:00 P.M',
  ];
  return timeSlotList[index];
}

class SortTimeTile extends StatelessWidget {
  const SortTimeTile({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });

  final String title;
  final String subTitle;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ListTile(
      onTap: onTap,
      leading: Icon(
        Icons.calendar_month,
        color: ToothNoteColors.backgroundColor,
        size: size.width * 0.09,
      ),
      horizontalTitleGap: size.width * 0.06,
      title: Text(
        title,
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: size.width * 0.045,
            color: ToothNoteColors.kBlackColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      subtitle: subTitle.isEmpty
          ? null
          : Text(
              subTitle,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: size.width * 0.035,
                  color: ToothNoteColors.kBlackColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
    );
  }
}

String getMonthInWords(int month) {
  // List of short month codes
  List<String> shortMonthCodes = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  // Get the month index from the date
  int monthIndex = month - 1;

  // Get the short month code from the list
  String shortMonth = shortMonthCodes[monthIndex];

  return shortMonth;
}

Future<void> showPopup(
  BuildContext context,
  Size size,
) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          content: SizedBox(
              width: size.width * 0.8,
              height: size.width * 0.8,
              child: const DatePickerWidget()));
    },
  );
}

class DatePickerWidget extends ConsumerWidget {
  const DatePickerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CalendarDatePicker(
      initialDate: ref.watch(homeSortDateProvider) ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(3000),
      onDateChanged: (value) {
        // log('Value${value.value}');
        addSortingDate(value, ref);
        Navigator.pop(context);
        Navigator.pop(context);
      },
    );
  }
}
