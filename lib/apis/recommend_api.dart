import 'dart:convert';

import 'package:front_end/models/recommend_model.dart';
import 'package:front_end/utils/api_helper.dart';

class RecommendApis {
  static Future<RecommendList> recommend(String label) async {
    // Send label to server
    final response = await ApiHelper.post("recommend", {"name": label});
    // Return response
    return RecommendList.fromJson(
      jsonDecode(response.body),
    );
  }
}
