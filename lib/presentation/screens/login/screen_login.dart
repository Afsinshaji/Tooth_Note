import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:tooth_note/infrastructure/services/secure_storage.dart';
import 'package:tooth_note/presentation/screens/home/screen_home.dart';
import 'package:tooth_note/presentation/widgets/alert_snackbar.dart';
import 'package:tooth_note/utilities/colors.dart';

class LoginScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController emailTextController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      // backgroundColor: ToothNoteColors.backgroundColor.withOpacity(0.95),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            ToothNoteColors.backgroundColor.withOpacity(0.7),
            ToothNoteColors.backgroundColor.withOpacity(0.9)
          ],
          // begin: Alignment.topLeft,
          // end: Alignment.bottomRight,
        )),
        child: SafeArea(
          child: Center(
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const LogoWidget(),
                        const TextbeforeField(text: 'User Name'),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        SignTextField(
                          controller: emailTextController,
                          text: "Enter User Name",
                          icon: Icons.person_2_outlined,
                          isTextPasswordType: false,
                          isTextEmailType: true,
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        const TextbeforeField(text: 'Password'),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        SignTextField(
                          controller: passwordTextController,
                          text: "Enter password",
                          icon: Icons.lock_outline,
                          isTextPasswordType: true,
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        // const Align(
                        //     alignment: Alignment.centerRight,
                        //     child: ForgotPasswordButton()),

                        SignButton(
                            text: "LOG IN",
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                if (emailTextController.text == 'Divine' &&
                                    passwordTextController.text ==
                                        'Divine@123') {
                                  await StorageService.instance
                                      .writeSecureData(
                                          StorageItem('loginStatus', 'true'))
                                      .then(
                                          (value) => Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const HomeScreen(),
                                                ),
                                              ));
                                } else {
                                  alertSnackbar(
                                      context, 'wrong username or password !');
                                }

                                // BlocProvider.of<AuthenticationBloc>(context)
                                //     .add(AuthenticationEvent.logIn(
                                //         email: emailTextController.text,
                                //         password: passwordTextController.text,
                                //         context: context));
                              }
                            },
                            width: size.width),
                      ],
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Center(
      child: Image.asset(
        'assets/images/WhatsApp_Image_2024-03-15_at_20.36.01-removebg-preview.png',
        height: size.height * 0.15,
      ),
    );
  }
}

class TextbeforeField extends StatelessWidget {
  const TextbeforeField({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          textStyle: const TextStyle(
            letterSpacing: .5,
            fontSize: 16,
            color: ToothNoteColors.kWhiteColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class SignTextField extends StatefulWidget {
  const SignTextField({
    super.key,
    required this.controller,
    required this.isTextPasswordType,
    required this.icon,
    required this.text,
    this.isTextEmailType = false,
    this.isTextPasswordConfirmType = false,
    this.enteredPassword = '',
    this.floatingLabelBehavior = FloatingLabelBehavior.never,
    this.isTextNumberType = false,
  });

  final TextEditingController controller;
  final bool isTextPasswordType;
  final IconData icon;
  final String text;
  final bool isTextEmailType;
  final bool isTextPasswordConfirmType;
  final String enteredPassword;
  final FloatingLabelBehavior floatingLabelBehavior;
  final bool isTextNumberType;

  @override
  State<SignTextField> createState() => _SignTextFieldState();
}

late bool isVisible;

class _SignTextFieldState extends State<SignTextField> {
  @override
  void initState() {
    super.initState();
    isVisible = widget.isTextPasswordType;
  }

  @override
  Widget build(BuildContext context) {
    // final Size size =MediaQuery.of(context).size;
    return Material(
      shadowColor: ToothNoteColors.kBlackColor,
      elevation: 2,
      borderRadius: BorderRadius.circular(15),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isTextPasswordType ? isVisible : false,
        enableSuggestions: !widget.isTextPasswordType,
        autocorrect: !widget.isTextPasswordType,
        cursorColor: ToothNoteColors.kBlackColor,
        style: TextStyle(
          color: ToothNoteColors.kBlackColor.withOpacity(0.9),
          //fontSize:size.width*0.04
        ),
        decoration: InputDecoration(
            suffixIcon: widget.isTextPasswordType
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    icon: Icon(
                        isVisible ? Icons.visibility_off : Icons.visibility),
                    color: ToothNoteColors.kBlackColor,
                  )
                : null,
            prefixIcon: Icon(
              widget.icon,
              color: ToothNoteColors.kBlackColor,
            ),
            hintText: widget.text,
            hintStyle: TextStyle(
              color: ToothNoteColors.kBlackColor.withOpacity(0.6),
            ),
            filled: true,
            floatingLabelBehavior: widget.floatingLabelBehavior,
            fillColor: ToothNoteColors.kWhiteColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(width: 0, style: BorderStyle.none),
            )),
        keyboardType: widget.isTextNumberType
            ? TextInputType.number
            : widget.isTextPasswordType
                ? TextInputType.visiblePassword
                : TextInputType.emailAddress,
        validator: (text) {
          if (text == null || text.isEmpty) {
            return "Can't be Empty";
          }
          // if (widget.isTextEmailType &&
          //     !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          //         .hasMatch(text)) {
          //   return 'Enter a valid Email';
          // }
          if (widget.isTextPasswordConfirmType &&
              text != widget.enteredPassword) {
            return "password doesn't match";
          }
          if (widget.isTextPasswordType && text.length < 6) {
            return 'Minimum password length is 6';
          }

          return null;
        },
      ),
    );
  }
}

class SignButton extends StatelessWidget {
  const SignButton({
    super.key,
    required this.onTap,
    required this.width,
    required this.text,
    this.changeColor = ToothNoteColors.backgroundColor,
    this.backGroundColor = ToothNoteColors.kWhiteColor,
    this.textColor = ToothNoteColors.kBlackColor,
  });

  final dynamic width;
  final Function onTap;
  final String text;
  final Color changeColor;
  final Color backGroundColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return changeColor;
            }
            return backGroundColor;
          }),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
