import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';

import 'package:front_end/models/detected_model.dart';
import 'package:front_end/utils/api_helper.dart';

class PredictApis {
  static Future<Detected> predict(File file) async {
    // Convert File to base64 string
    Uint8List imagebytes = file.readAsBytesSync();
    String base64string = base64.encode(imagebytes);
    // Send base64 string to server
    final response = await ApiHelper.post('predict', {'image': base64string});
    // Return response
    return Detected.fromJson(
      jsonDecode(response.body),
    );
  }
}
