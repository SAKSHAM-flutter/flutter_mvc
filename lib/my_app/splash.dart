import 'package:flutter/material.dart';
import 'package:mvc_flutter/data/utils/connectivity_status.dart';
import 'package:mvc_flutter/ui/screens/home/home_screen.dart';
import 'package:mvc_flutter/ui/themes/typography.dart';

class SplashScreen extends StatefulWidget {
  static const String route = "/SplashScreen";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(seconds: 2), () {
        NetworkConnection.checkInternetAgain().then((value) =>
            Navigator.pushNamedAndRemoveUntil(
                context, HomeScreen.route, (route) => false));
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Center(
          child: Text(
            "Splash..",
            style: Poppins.semiBold().s16,
          ),
        ),
      ),
    );
  }
}
