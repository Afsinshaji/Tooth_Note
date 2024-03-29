
  import 'package:flutter/material.dart';

void showLoadingOverlay(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevents dismissing with a tap on the background
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
