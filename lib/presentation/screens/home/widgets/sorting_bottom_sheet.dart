import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tooth_note/presentation/view_states/home/riverpod_home.dart';
import 'package:tooth_note/utilities/colors.dart';

class SortingBottomSheet extends ConsumerWidget {
  const SortingBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.43,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.03,
          ),
          Text(
            'Sort By Date',
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
          SortTimeTile(
              onTap: () {
                addSortingDate(DateTime.now(), ref);
                Navigator.pop(context);
              },
              title: 'Today',
              subTitle:
                  '${getMonthInWords(DateTime.now().month)} ${DateTime.now().day}'),
          SortTimeTile(
            title: 'Yesterday',
            subTitle:
                '${getMonthInWords(DateTime.now().subtract(const Duration(days: 1)).month)} ${DateTime.now().subtract(const Duration(days: 1)).day}',
            onTap: () {
              addSortingDate(
                  DateTime.now().subtract(const Duration(days: 1)), ref);
              Navigator.pop(context);
            },
          ),
          SortTimeTile(
            title: 'Custom Date',
            subTitle: '',
            onTap: () {
              showPopup(context, size);
            },
          ),
          SortTimeTile(
            title: 'All Dates',
            subTitle: '',
            onTap: () {
              addSortingDate(null, ref);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
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
