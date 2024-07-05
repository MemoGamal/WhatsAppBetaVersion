import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsappclonememo/presentation/onboarding/view/onboarding.dart';
import 'package:whatsappclonememo/presentation/mainscreen/view/mainview.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Error");
        }
        if (snapshot.hasData) {
          // Logged in ..
          return const Mainview();
        } else {
          return const OnBoardingView();
        }
      },
    );
  }
}
