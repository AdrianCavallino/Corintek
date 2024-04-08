import 'package:camera/camera.dart';
import 'package:corintek_app/screen/Camera/image_preview_screen.dart';
import 'package:edge_detection/edge_detection.dart';
import 'package:flutter/material.dart';

class CustomCamera extends StatefulWidget {
  const CustomCamera({super.key, required this.camera});

  final CameraDescription camera;

  @override
  State<CustomCamera> createState() => _CustomCameraState();
}

class _CustomCameraState extends State<CustomCamera> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    // Create Camera Controller
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.max,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Stack(
            children: [
              SizedBox(
                height: double.infinity,
                child: CameraPreview(_controller),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height / 30,
                left: MediaQuery.of(context).size.width / 6,
                child: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(157, 0, 0, 0)),
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width / 1.5,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                heightFactor: 10.43,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      shape: const CircleBorder(),
                      minimumSize: const Size(80, 80)),
                  onPressed: () async {
                    try {
                      await _initializeControllerFuture;

                      final image = await _controller.takePicture();

                      if (!context.mounted) return;

                      await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              ImagePreviewScreen(imagePath: image.path),
                        ),
                      );
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: const Icon(
                    Icons.camera_alt_rounded,
                    size: 30,
                  ),
                ),
              )
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
