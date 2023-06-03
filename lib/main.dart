import 'dart:io';

import 'package:better_open_file/better_open_file.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_camera_example/pages/ai_analysis_barcode.dart';
import 'package:flutter_camera_example/pages/ai_analysis_faces%20.dart';
import 'package:flutter_camera_example/pages/camera_awesome.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Material App Bar'),
          ),
          body: Builder(builder: (context) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _openCameraAwesome(context),
                  _openBarcodeAnalysis(context),
                  _openFaceAnalysis(context),
                ],
              ),
            );
          })),
    );
  }

  ElevatedButton _openCameraAwesome(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CameraAwesomePage(),
              ));
        },
        child: const Text("Open Camera"));
  }

  ElevatedButton _openBarcodeAnalysis(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BarcodeAnalysisPage(),
              ));
        },
        child: const Text("Open Barcode Analysis"));
  }

  ElevatedButton _openFaceAnalysis(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FaceAnalysisPage(),
              ));
        },
        child: const Text("Open Face Analysis"));
  }
}
