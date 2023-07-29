class AIMessageModel {
  String message = '';
  AIMessageModel();

  factory AIMessageModel.fromJson(Map<String, dynamic> json) {
    return AIMessageModel()..message = json['generated_text'] as String;
  }
}
