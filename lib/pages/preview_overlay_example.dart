import 'dart:async';

import 'package:better_open_file/better_open_file.dart';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_camera_example/utils/mlkit_utils.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';

import '../widget/barcode_preview_overlay.dart';

class PreviewOverlayExamplePage extends StatefulWidget {
  const PreviewOverlayExamplePage({super.key});

  @override
  State<PreviewOverlayExamplePage> createState() => _PreviewOverlayExamplePageState();
}

class _PreviewOverlayExamplePageState extends State<PreviewOverlayExamplePage> {
  final _barcodeScanner = BarcodeScanner(formats: [BarcodeFormat.all]);
  List<Barcode> _barcodes = [];
  AnalysisImage? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: CameraAwesomeBuilder.awesome(
          saveConfig: SaveConfig.photoAndVideo(
            initialCaptureMode: CaptureMode.photo,
          ),
          sensorConfig: SensorConfig.single(
            flashMode: FlashMode.auto,
            aspectRatio: CameraAspectRatios.ratio_16_9,
          ),
          previewFit: CameraPreviewFit.fitWidth,
          onMediaTap: (mediaCapture) {
            OpenFile.open(
              mediaCapture.captureRequest
                  .when(single: (single) => single.file?.path),
            );
          },
          previewDecoratorBuilder: (state, previewSize, previewRect) {
            return BarcodePreviewOverlay(
              state: state,
              previewSize: previewSize,
              previewRect: previewRect,
              barcodes: _barcodes,
              analysisImage: _image,
            );
          },
          topActionsBuilder: (state) {
            return AwesomeTopActions(
              state: state,
              children: [
                AwesomeFlashButton(state: state),
                if (state is PhotoCameraState)
                  AwesomeAspectRatioButton(state: state),
              ],
            );
          },
          middleContentBuilder: (state) {
            return const SizedBox.shrink();
          },
          bottomActionsBuilder: (state) {
            return const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                "Scan your barcodes",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            );
          },
          onImageForAnalysis: (img) => _processImageBarcode(img),
          imageAnalysisConfig: AnalysisConfig(
            androidOptions: const AndroidAnalysisOptions.nv21(
              width: 256,
            ),
            maxFramesPerSecond: 3,
          ),
        ),
      ),
    );
  }

  Future _processImageBarcode(AnalysisImage img) async {
    try {
      var recognizedBarCodes =
          await _barcodeScanner.processImage(img.toInputImage());
      setState(() {
        _barcodes = recognizedBarCodes;
        _image = img;
      });
    } catch (error) {
      debugPrint("...sending image resulted error $error");
    }
  }
}
