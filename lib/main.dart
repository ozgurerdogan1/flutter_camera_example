import 'dart:io';

import 'package:better_open_file/better_open_file.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_camera_example/pages/ai_analysis_barcode.dart';
import 'package:flutter_camera_example/pages/ai_analysis_faces%20.dart';
import 'package:flutter_camera_example/pages/analysis_image_filter.dart';
import 'package:flutter_camera_example/pages/analysis_image_filter_picker.dart';
import 'package:flutter_camera_example/pages/camera_analysis_capabilities.dart';
import 'package:flutter_camera_example/pages/camera_awesome.dart';
import 'package:flutter_camera_example/pages/custom_awesome_ui.dart';
import 'package:flutter_camera_example/pages/custom_theme.dart';
import 'package:flutter_camera_example/pages/custom_ui_example_1.dart';
import 'package:flutter_camera_example/pages/custom_ui_example_2.dart';
import 'package:flutter_camera_example/pages/custom_ui_example_3.dart';
import 'package:flutter_camera_example/pages/drivable_camera.dart';
import 'package:flutter_camera_example/pages/preview_overlay_example.dart';
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
                  _openImageFilter(context),
                  _openImageFilterPicker(context),
                  _openCameraAnalysisCapabilitiesPage(context),
                  _openCustomAwesomeUIPage(context),
                  _openCustomUIExample1Page(context),
                  _openCustomUIExample2Page(context),
                  _openCustomUIExample3Page(context),
                  _openCustomThemePage(context),
                  _openDrivableCameraPage(context),
                  _openPreviewOverlayExamplePage(context)
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

  ElevatedButton _openImageFilter(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ImageFilterPage(),
              ));
        },
        child: const Text("Open Image Filter"));
  }

  ElevatedButton _openImageFilterPicker(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ImageFilterPickerPage(),
              ));
        },
        child: const Text("Open Image Filter Picker"));
  }

  ElevatedButton _openCameraAnalysisCapabilitiesPage(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CameraAnalysisCapabilitiesPage(),
              ));
        },
        child: const Text("Open Camre Analysis Capabilites"));
  }

  ElevatedButton _openCustomAwesomeUIPage(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CustomAwesomeUIPage(),
              ));
        },
        child: const Text("Open Custom Awesome UI"));
  }

  ElevatedButton _openCustomUIExample1Page(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CustomUiExample1Page(),
              ));
        },
        child: const Text("Open Custom UI Example 1"));
  }

  ElevatedButton _openCustomUIExample2Page(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CustomUiExample2Page(),
              ));
        },
        child: const Text("Open Custom UI Example 2"));
  }

  ElevatedButton _openCustomUIExample3Page(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CustomUiExample3Page(),
              ));
        },
        child: const Text("Open Custom UI Example 3"));
  }

  ElevatedButton _openCustomThemePage(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CustomThemePage(),
              ));
        },
        child: const Text("Open Custom Theme"));
  }

  ElevatedButton _openDrivableCameraPage(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DrivableCameraPage(
                  saveConfig: SaveConfig.photoAndVideo(),
                  sensors: [
                    Sensor.position(SensorPosition.back),
                  ],
                ),
              ));
        },
        child: const Text("Open Drivable Camera"));
  }

  ElevatedButton _openPreviewOverlayExamplePage(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PreviewOverlayExamplePage(),
              ));
        },
        child: const Text("Open Preview Overlay Example"));
  }
}
