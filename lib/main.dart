import 'package:camera/camera.dart';
import 'package:corintek_app/screen/Camera/camera_screen.dart';
import 'package:corintek_app/screen/Home/home_screen.dart';
import 'package:flutter/material.dart';

late List<CameraDescription> cameras;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const CorintekApp());
}

class CorintekApp extends StatelessWidget {
  const CorintekApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
