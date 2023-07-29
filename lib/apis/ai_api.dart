import 'dart:convert';

import 'package:front_end/models/ai_message_model.dart';
import 'package:front_end/utils/api_helper.dart';

class AIMessageApis {
  static Future<AIMessageModel> ask(String message) async {
    // Send message to server
    final response = await ApiHelper.post("message", {"prompt": message});
    // Return response
    return AIMessageModel.fromJson(
      jsonDecode(response.body),
    );
  }
}
