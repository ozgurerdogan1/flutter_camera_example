import 'dart:io';

import 'package:better_open_file/better_open_file.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class CameraAwesomePage extends StatelessWidget {
  const CameraAwesomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CameraAwesomeBuilder.awesome(
      saveConfig: SaveConfig.photoAndVideo(),
      onMediaTap: (mediaCapture) {
        OpenFile.open(mediaCapture.captureRequest.when(
          single: (p0) {
            return p0.file?.path;
          },
        ));
      },
    );
  }
}
