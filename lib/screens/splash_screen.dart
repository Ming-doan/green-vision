import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:front_end/screens/main_screen.dart';
import 'package:front_end/utils/app_color.dart';
import 'package:front_end/utils/app_string.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Get the list of available cameras.
    availableCameras().then((cameras) => {
          if (cameras.isNotEmpty)
            {
              // Navigate to Main Screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => MainPage(cameras: cameras),
                ),
              )
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.green, Colors.lightGreen],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        image: DecorationImage(
          image: const AssetImage('assets/images/bbg.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.green.withOpacity(0.3), BlendMode.dstATop),
        ),
      ),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(AppStrings.appName,
              style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor)),
          const SizedBox(height: 20),
          const CircularProgressIndicator(
            color: AppColors.primaryColor,
          )
        ],
      )),
    );
  }
}
