import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tooth_note/application/all_patients/all_patients_bloc.dart';
import 'package:tooth_note/application/patient/patient_bloc.dart';
import 'package:tooth_note/application/view_dto/patients/patients.dart';
import 'package:tooth_note/presentation/screens/add_patient/screen_add_patient.dart';
import 'package:tooth_note/presentation/screens/patients/widgets/sorting_bottom_sheet.dart';
import 'package:tooth_note/presentation/screens/login/screen_login.dart';
import 'package:tooth_note/presentation/screens/view_patient/screen_view_patient.dart';
import 'package:tooth_note/presentation/view_states/add_patient/riverpod_add_patient.dart';
import 'package:tooth_note/presentation/view_states/home/riverpod_home.dart';
import 'package:tooth_note/presentation/widgets/alert_box.dart';
import 'package:tooth_note/presentation/widgets/shimmer_loading.dart';
import 'package:tooth_note/utilities/Colors.dart';
import 'package:google_fonts/google_fonts.dart';

class PatientsScreen extends StatefulWidget {
  const PatientsScreen({super.key});

  @override
  State<PatientsScreen> createState() => _PatientsScreenState();
}

class _PatientsScreenState extends State<PatientsScreen> {
  final TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    BlocProvider.of<AllPatientsBloc>(context)
        .add(const AllPatientsEvent.getPatientList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Shimmer(
      linearGradient: shimmerGradient,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: size * 0.17,
          child: ColoredBox(
            color: ToothNoteColors.backgroundColor,
            child: Column(
              children: [
                // AppBar(

                //     //  titleSpacing: size.width * 0.14,
                //     //   leadingWidth: size.width * 0.11,
                //     leading: const LogoWidget(),
                //     backgroundColor: ToothNoteColors.backgroundColor,
                //     actions: [
                //       Row(
                //         children: [
                //           Column(
                //             mainAxisAlignment: MainAxisAlignment.end,
                //             children: [
                //               SizedBox(
                //                 height: size.height * 0.027,
                //               ),
                // Text(
                //   'Divine Dental Clinic',
                //   style: GoogleFonts.playfairDisplay(
                //     textStyle: TextStyle(
                //       fontStyle: FontStyle.italic,
                //       letterSpacing: 1,
                //       fontSize: size.width * 0.055,
                //       color: ToothNoteColors.kWhiteColor,
                //       fontWeight: FontWeight.w700,
                //     ),
                //   ),
                // ),
                //               // Positioned(
                //               //   // left: 0,
                //               //   top: 0,
                //               //   right: 0,
                //               //   child: Center(
                //               //     child: Image.asset(
                //               //       'assets/images/WhatsApp_Image_2024-03-15_at_20.36.01-removebg-preview.png',
                //               //       height: size.height * 0.04,
                //               //     ),
                //               //   ),
                //               // ),
                //             ],
                //           ),
                //           SizedBox(
                //             width: size.width * 0.03,
                //           )
                //         ],
                //       )
                //     ]),

                Container(
                  color: ToothNoteColors.backgroundColor,
                  width: size.width,
                  height: size.height * 0.085,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: size.height * 0.045,
                      ),
                      Text(
                        'Patients List',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            letterSpacing: 1,
                            fontSize: size.width * 0.055,
                            color: ToothNoteColors.kWhiteColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SearchContainer(size: size, searchController: searchController)
              ],
            ),
          ),
        ),
        backgroundColor: ToothNoteColors.kLightBluwWhite,
        floatingActionButton: AddFloatingbutton(size: size),
        body: PatientListSection(size: size),
      ),
    );
  }
}

class AddFloatingbutton extends ConsumerWidget {
  const AddFloatingbutton({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        addTime(DateTime.now(), ref);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddPatientScreen(),
            ));
      },
      child: Container(
        height: size.width * 0.15,
        width: size.width * 0.15,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: ToothNoteColors.backgroundColor),
        child: Icon(
          Icons.add,
          color: ToothNoteColors.kWhiteColor,
          size: size.width * 0.1,
        ),
      ),
    );
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
    String search = ref.watch(homeSearchProvider);
    final sortDate = ref.watch(homeSortDateProvider);
    return SafeArea(child: BlocBuilder<AllPatientsBloc, AllPatientsState>(
      builder: (context, allPatientState) {
        List<PatientsDetailsDTO> patientsList = [];
        bool isLoading = true;

        if (allPatientState is displayallPatient) {
          patientsList = allPatientState.patient.reversed.toList();
          isLoading = false;
        }
        if (search.isNotEmpty) {
          patientsList = patientsList
              .where((element) =>
                  element.patientName
                      .toLowerCase()
                      .contains(search.toLowerCase().trim()) ||
                  element.patientNumber
                      .toLowerCase()
                      .contains(search.toLowerCase().trim()) ||
                  element.phoneNumber
                      .toLowerCase()
                      .contains(search.toLowerCase().trim()))
              .toList();
        }

        if (sortDate != null) {
          patientsList = patientsList
              .where((element) =>
                  sortDate.day == DateTime.parse(element.date).day &&
                  sortDate.month == DateTime.parse(element.date).month &&
                  sortDate.year == DateTime.parse(element.date).year)
              .toList();
        }
        // List<GlobalKey> globalList = [];
        // for (var p in patientsList) {
        // GlobalKey buttonKey = GlobalKey();
        //   globalList.add(_buttonKey);
        // }

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
          child: ShimmerLoading(
            isLoading: isLoading,
            child: patientsList.isEmpty
                ? SingleChildScrollView(
                  child: Column(
                      children: [
                        const DisplaySortingDate(),
                        SizedBox(
                          height: size.height * 0.1,
                        ),
                        Center(
                          child: Image.asset(
                            'assets/images/social-doctor-doing-a-health-check-up.gif',
                          ),
                        ),
                      ],
                    ),
                )
                : ListView.separated(
                    itemCount: isLoading ? 10 : patientsList.length + 2,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return const Center(
                          child: DisplaySortingDate(),
                        );
                      }

                      if (index == patientsList.length + 1) {
                        return SizedBox(
                          height: size.height * 0.1,
                        );
                      }

                      return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.01),
                        child: Material(
                          color: ToothNoteColors.kWhiteColor,
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            onLongPress: () {
                              if (!isLoading) {
                                // showPopupMenu(
                                //   context,
                                //   size,
                                //   patientsList[index],
                                //   index,
                                // );
                              }
                            },
                            child: ListTile(
                              onTap: () {
                                if (!isLoading) {
                                  BlocProvider.of<PatientBloc>(context).add(
                                      PatientEvent.getPatientsDetails(
                                          patientId: patientsList[index - 1]
                                              .patientId!));
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) =>
                                            const ViewPatientScreen(),
                                      ));
                                }
                              },
                              title: Text(
                                isLoading
                                    ? ''
                                    : patientsList[index - 1].patientName,
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: size.width * 0.045,
                                    color: ToothNoteColors.kBlackColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              trailing: Icon(
                                Icons.person,
                                size: size.width * 0.1,
                                color: ToothNoteColors.backgroundColor,
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    isLoading
                                        ? ''
                                        : 'Patient Number: ${patientsList[index - 1].patientNumber}',
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: size.width * 0.038,
                                        color: ToothNoteColors.kBlackColor,
                                        //  fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    isLoading
                                        ? ''
                                        : 'Phone Number: ${patientsList[index - 1].phoneNumber}',
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: size.width * 0.038,
                                        color: ToothNoteColors.kBlackColor,
                                        // fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: size.height * 0.015,
                      );
                    },
                  ),
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
