import 'package:budget_buddy/src/features/base/base.dart';
// import 'package:budget_buddy/src/routes/route_handler.dart';
import 'package:flutter/material.dart';

// import '../../routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3)); // Simulating splash delay

    // Example logic to determine where to navigate
    // bool isFirstTime = true; // Example check for onboarding
    // bool isLoggedIn = false; // Example check for user login


    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const BasePage()), (Route<dynamic> route) => false );

    // if (isFirstTime) {
    //   Navigator.pushReplacementNamed(context, AppRoutes.onboarding);
    // } else if (!isLoggedIn) {
    //   Navigator.pushReplacementNamed(context, AppRoutes.login);
    // } else {
    //   Navigator.pushReplacementNamed(context, AppRoutes.base);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
