import 'dart:async';

import 'package:flutter/material.dart';
import 'package:upyog/widgets/language_selection_screen.dart';
//import 'package:upyog/widgets/register_screen.dart';

class SplashService {
  void displayScreen(BuildContext context) {
    Timer(
        const Duration(seconds: 4),
        () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const LanguageSelectionScreen())));
  }
}
