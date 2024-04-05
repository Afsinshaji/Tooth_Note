import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tooth_note/application/all_bookings/all_bookings_bloc.dart';
import 'package:tooth_note/application/all_patients/all_patients_bloc.dart';
import 'package:tooth_note/application/patient/patient_bloc.dart';
import 'package:tooth_note/application/view_dto/booking/booking.dart';
import 'package:tooth_note/application/view_dto/patients/patients.dart';
import 'package:tooth_note/presentation/screens/add_booking/screen_add_booking.dart';
import 'package:tooth_note/presentation/screens/add_patient/screen_add_patient.dart';
import 'package:tooth_note/presentation/screens/bookings/screen_bookings.dart';
import 'package:tooth_note/presentation/screens/patients/screen_patients.dart';
import 'package:tooth_note/presentation/screens/patients/widgets/sorting_bottom_sheet.dart';
import 'package:tooth_note/presentation/screens/login/screen_login.dart';
import 'package:tooth_note/presentation/view_states/add_patient/riverpod_add_patient.dart';
import 'package:tooth_note/presentation/view_states/bookings/riverpod_bookings.dart';
import 'package:tooth_note/presentation/view_states/home/riverpod_home.dart';
import 'package:tooth_note/presentation/widgets/alert_box.dart';
import 'package:tooth_note/presentation/widgets/shimmer_loading.dart';
import 'package:tooth_note/utilities/Colors.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    BlocProvider.of<AllPatientsBloc>(context)
        .add(const AllPatientsEvent.getPatientList());
    BlocProvider.of<AllBookingsBloc>(context)
        .add(const AllBookingsEvent.getBookedPatientList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Shimmer(
      linearGradient: shimmerGradient,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: size * 0.1,
          child: Column(
            children: [
              AppBar(
                  toolbarHeight: size.height * 0.1,
                  leading: const LogoWidget(),
                  backgroundColor: ToothNoteColors.backgroundColor,
                  actions: [
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: size.height * 0.027,
                            ),
                            Text(
                              'Divine Dental Clinic',
                              style: GoogleFonts.playfairDisplay(
                                textStyle: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  letterSpacing: 1,
                                  fontSize: size.width * 0.055,
                                  color: ToothNoteColors.kWhiteColor,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: size.width * 0.03,
                        )
                      ],
                    )
                  ]),
            ],
          ),
        ),
        backgroundColor: ToothNoteColors.kLightBluwWhite,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(size.width * 0.05),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            color: ToothNoteColors.kBlackColor.withOpacity(0.6),
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Text('Bookings',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: size.width * 0.045,
                                  color: ToothNoteColors.kBlackColor
                                      .withOpacity(0.6),
                                  fontWeight: FontWeight.w500,
                                ),
                              ))
                        ],
                      ),
                      AddBookingButton(size: size)
                    ],
                  ),
                ),
                BookingsContainer(size: size),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.people_alt,
                            color: ToothNoteColors.kBlackColor.withOpacity(0.6),
                          ),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          Text('Patients',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: size.width * 0.045,
                                  color: ToothNoteColors.kBlackColor
                                      .withOpacity(0.6),
                                  fontWeight: FontWeight.w500,
                                ),
                              ))
                        ],
                      ),
                      AddPatientbutton(size: size)
                    ],
                  ),
                ),
                PatientsContainer(size: size)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PatientsContainer extends ConsumerWidget {
  const PatientsContainer({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return BlocBuilder<AllPatientsBloc, AllPatientsState>(
      builder: (context, patientState) {
        List<PatientsDetailsDTO> patientList = [];
        if (patientState is displayallPatient) {
          patientList = patientState.patient;
        }
        return Container(
          height: size.height * 0.16,
          width: size.width,
          margin: EdgeInsets.all(size.width * 0.0),
          padding: EdgeInsets.all(size.width * 0.02),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Shadow color
                  spreadRadius: 5, // Spread radius
                  blurRadius: 7, // Blur radius
                  offset: const Offset(0, 3), // Offset of the shadow
                )
              ],
              borderRadius: BorderRadius.circular(5),
              color: ToothNoteColors.kWhiteColor),
          child: InkWell(
            onTap: () {
              addSortingDate(DateTime.now(), ref);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PatientsScreen(),
                ),
              );
            },
            child: Column(
              children: [
                ListTile(
                  leading: Text(
                      patientList
                          .where((element) =>
                              DateTime.parse(element.date).day ==
                                  DateTime.now().day &&
                              DateTime.parse(element.date).month ==
                                  DateTime.now().month &&
                              DateTime.parse(element.date).year ==
                                  DateTime.now().year)
                          .toList()
                          .length
                          .toString(),
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: size.width * 0.09,
                          color: ToothNoteColors.backgroundColor,
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                  title: Text('Today',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: size.width * 0.04,
                          color: ToothNoteColors.kBlackColor,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                  trailing: const Icon(
                    Icons.remove_red_eye,
                    color: ToothNoteColors.backgroundColor,
                  ),
                ),
                ListTile(
                  leading: Text('${patientList.length}',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: size.width * 0.09,
                          color: ToothNoteColors.backgroundColor,
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                  title: Text('Total Patients',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: size.width * 0.04,
                          color: ToothNoteColors.kBlackColor,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                  trailing: const Icon(
                    Icons.bookmark,
                    color: ToothNoteColors.backgroundColor,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class BookingsContainer extends ConsumerWidget {
  const BookingsContainer({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BlocBuilder<AllBookingsBloc, AllBookingsState>(
      builder: (context, bookstate) {
        List<BookingsDTO> bookingList = [];
        if (bookstate is displayAllBookedPatient) {
          bookingList = bookstate.patient;
        }

        return InkWell(
          onTap: () {
            addBookingSortingDate(DateTime.now(), ref);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BookingsScreen(),
              ),
            );
          },
          child: Container(
            height: size.height * 0.23,
            width: size.width,
            margin: EdgeInsets.all(size.width * 0.0),
            padding: EdgeInsets.all(size.width * 0.02),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: ToothNoteColors.kWhiteColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Shadow color
                    spreadRadius: 5, // Spread radius
                    blurRadius: 7, // Blur radius
                    offset: const Offset(0, 3), // Offset of the shadow
                  )
                ]),
            child: Column(
              children: [
                ListTile(
                  leading: Text(
                      bookingList
                          .where((element) =>
                              DateTime.parse(element.date).day ==
                                  DateTime.now().day &&
                              DateTime.parse(element.date).month ==
                                  DateTime.now().month &&
                              DateTime.parse(element.date).year ==
                                  DateTime.now().year)
                          .toList()
                          .length
                          .toString(),
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: size.width * 0.09,
                          color: ToothNoteColors.backgroundColor,
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                  title: Text('Today',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: size.width * 0.04,
                          color: ToothNoteColors.kBlackColor,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                  trailing: const Icon(
                    Icons.remove_red_eye,
                    color: ToothNoteColors.backgroundColor,
                  ),
                ),
                ListTile(
                  leading: Text(
                      bookingList
                          .where((element) => DateTime.parse(element.date)
                              .isAfter(DateTime.now()))
                          .toList()
                          .length
                          .toString(),
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: size.width * 0.09,
                          color: ToothNoteColors.backgroundColor,
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                  title: Text('Upcoming',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: size.width * 0.04,
                          color: ToothNoteColors.kBlackColor,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                  trailing: const Icon(
                    Icons.send,
                    color: ToothNoteColors.backgroundColor,
                  ),
                ),
                ListTile(
                  leading: Text(bookingList.length.toString(),
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: size.width * 0.09,
                          color: ToothNoteColors.backgroundColor,
                          fontWeight: FontWeight.w700,
                        ),
                      )),
                  title: Text('Total',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: size.width * 0.04,
                          color: ToothNoteColors.kBlackColor,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                  trailing: const Icon(
                    Icons.bookmark,
                    color: ToothNoteColors.backgroundColor,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class AddBookingButton extends ConsumerWidget {
  const AddBookingButton({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
        onPressed: () {
          addTime(DateTime.now(), ref);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddBookingScreen(),
            ),
          );
        },
        icon: Icon(
          Icons.add,
          color: ToothNoteColors.backgroundColor,
          size: size.width * 0.08,
        ));
  }
}

class AddPatientbutton extends ConsumerWidget {
  const AddPatientbutton({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
        onPressed: () {
          addTime(DateTime.now(), ref);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddPatientScreen(),
              ));
        },
        icon: Icon(
          Icons.add,
          color: ToothNoteColors.backgroundColor,
          size: size.width * 0.08,
        ));
  }
}

class PatientListSection extends ConsumerWidget {
  const PatientListSection({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(child: BlocBuilder<AllPatientsBloc, AllPatientsState>(
      builder: (context, allPatientState) {
        List<PatientsDetailsDTO> patientsList = [];
        bool isLoading = true;

        if (allPatientState is displayallPatient) {
          patientsList = allPatientState.patient.reversed.toList();
          isLoading = false;
        }

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
          child: ShimmerLoading(
            isLoading: isLoading,
            child: Container(),
          ),
        );
      },
    ));
  }
}

class DisplaySortingDate extends ConsumerWidget {
  const DisplaySortingDate({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    DateTime? sortDate = ref.watch(homeSortDateProvider);
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.01,
        ),
        Container(
            padding: EdgeInsets.symmetric(
                vertical: size.width * 0.01, horizontal: size.width * 0.05),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: ToothNoteColors.backgroundColor),
            child: Text(
              sortDate == null
                  ? 'All'
                  : '${sortDate.day} ${getMonthInWords(sortDate.month)} ${sortDate.year}',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: size.width * 0.035,
                  color: ToothNoteColors.kWhiteColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )),
      ],
    );
  }
}

void showPopupMenu(
  BuildContext context,
  Size size,
  PatientsDetailsDTO patient,
  int index,
) {
  final RenderBox overlay =
      Overlay.of(context).context.findRenderObject() as RenderBox;
  final RenderBox button = context.findRenderObject() as RenderBox;

  final RelativeRect position = RelativeRect.fromRect(
    Rect.fromPoints(
      button.localToGlobal(button.size.topRight(Offset.zero),
          ancestor: overlay),
      button.localToGlobal(button.size.bottomRight(Offset.zero),
          ancestor: overlay),
    ),
    Offset.zero & overlay.size,
  );

  showMenu(
    color: ToothNoteColors.backgroundColor,
    context: context,
    position: position,
    items: [
      PopupMenuItem(
        value: 1,
        child: Row(
          children: [
            const Icon(
              Icons.delete,
              color: ToothNoteColors.kWhiteColor,
            ),
            Text(
              'delete',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  letterSpacing: .5,
                  color: ToothNoteColors.kWhiteColor.withOpacity(0.9),
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          ],
        ),
      ),
    ],
  ).then((value) {
    if (value != null) {
      if (value == 1) {
        alertBox(context, 'Delete', () {
          BlocProvider.of<PatientBloc>(context).add(
              PatientEvent.deletePatientDetail(patientId: patient.patientId!));
          BlocProvider.of<AllPatientsBloc>(context)
              .add(const AllPatientsEvent.getPatientList());

          Navigator.pop(context);
        }, size);
      }
    }
  });
}

class SearchContainer extends ConsumerWidget {
  const SearchContainer({
    super.key,
    required this.size,
    required this.searchController,
  });

  final Size size;
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: size.height * 0.1,
      decoration: const BoxDecoration(color: ToothNoteColors.backgroundColor),
      padding: EdgeInsets.all(size.width * 0.04),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
        width: size.width,
        color: const Color.fromRGBO(244, 67, 54, 1),
        child: TextField(
          onChanged: (value) {
            homeSearch(value, ref);
          },
          controller: searchController,
          style: GoogleFonts.openSans(
            textStyle: TextStyle(
              letterSpacing: .3,
              fontSize: size.width * 0.043,
              color: ToothNoteColors.kWhiteColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          cursorColor: ToothNoteColors.kWhiteColor,
          cursorWidth: 1,
          cursorHeight: 20,
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.only(left: 30, right: 10, top: 10),
              prefixIcon: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    context: context,
                    builder: (context) {
                      return const SortingBottomSheet();
                    },
                  );
                },
                icon: const Icon(Icons.sort),
                color: ToothNoteColors.kWhiteColor,
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 0.0),
                child: IconButton(
                  onPressed: () async {},
                  icon: const Icon(Icons.search),
                  color: ToothNoteColors.kWhiteColor,
                ),
              ),
              hintText: 'Search patient...',
              hintStyle: TextStyle(
                color: ToothNoteColors.kWhiteColor.withOpacity(0.9),
              ),
              filled: true,
              fillColor: ToothNoteColors.kredColor,
              // border: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(30.0),
              //   borderSide: const BorderSide(width: 0, style: BorderStyle.none),
              // )
              focusedBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide:
                      const BorderSide(color: ToothNoteColors.kWhiteColor)),
              enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide:
                      const BorderSide(color: ToothNoteColors.kWhiteColor)),
              errorBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide:
                      const BorderSide(color: ToothNoteColors.kWhiteColor)),
              border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide:
                      const BorderSide(color: ToothNoteColors.kWhiteColor))),
        ),
      ),
    );
  }
}
