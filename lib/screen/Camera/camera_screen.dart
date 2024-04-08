import 'package:camera/camera.dart';
import 'package:corintek_app/screen/Camera/Widgets/custom_camera.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key, required this.camera});

  final CameraDescription camera;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: CustomCamera(
          camera: camera,
        ),
      ),
    );
  }
}
