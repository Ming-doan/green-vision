import 'dart:io';
import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:front_end/apis/predict_api.dart';
import 'package:front_end/models/detected_model.dart';
import 'package:front_end/screens/recommend_screen.dart';
import 'package:front_end/utils/app_color.dart';
import 'package:front_end/utils/app_string.dart';
import 'package:front_end/utils/mock.dart';

class MainPage extends StatefulWidget {
  final List<CameraDescription> cameras;
  const MainPage({super.key, required this.cameras});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Camera controller
  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;
  // State
  bool _isCapturing = false;

  @override
  void initState() {
    super.initState();
    // Get the list of available cameras.
    _cameraController = CameraController(
      widget.cameras.first,
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _cameraController.initialize();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  void onChangeCamera() async {
    final CameraDescription cameraDescription =
        (_cameraController.description == widget.cameras.first)
            ? widget.cameras.last
            : widget.cameras.first;

    await _cameraController.dispose();
    setState(() {
      _cameraController = CameraController(
        cameraDescription,
        ResolutionPreset.medium,
      );
      _initializeControllerFuture = _cameraController.initialize();
    });
  }

  void onCapture() async {
    if (_isCapturing) return;
    try {
      // Capture image
      await _initializeControllerFuture;
      final image = await _cameraController.takePicture();
      debugPrint(image.path);
      // Set state to capturing
      setState(() {
        _isCapturing = true;
      });
      // Send image to server
      Detected data = await PredictApis.predict(File(image.path));
      // Set state to not capturing
      setState(() {
        _isCapturing = false;
      });
      // Navigate to Recommend Screen
      navigateToRecommendScreen(data, File(image.path));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void navigateToRecommendScreen(Detected data, File image) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) =>
            RecommendScreen(detected: data, image: image),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
          child: Column(
            children: [
              // App Name
              SizedBox(
                  height: 64,
                  child: Center(
                      child: Text(AppStrings.appName,
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)))),

              /// Camera
              Expanded(
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: FutureBuilder<void>(
                      future: _initializeControllerFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return CameraPreview(_cameraController);
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ),
                ),
              ),
              // Capture Button
              SizedBox(
                height: 114,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.image,
                          color: Colors.white,
                          size: 36,
                        )),
                    InkWell(
                      onTap: () => onCapture(),
                      child: Material(
                        color: Colors.transparent,
                        child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primaryColor,
                              border: Border.all(color: Colors.white, width: 4),
                            ),
                            child: _isCapturing
                                ? const CircularProgressIndicator()
                                : null),
                      ),
                    ),
                    IconButton(
                        onPressed: () => onChangeCamera(),
                        icon: const Icon(
                          Icons.flip_camera_ios,
                          color: Colors.white,
                          size: 36,
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
