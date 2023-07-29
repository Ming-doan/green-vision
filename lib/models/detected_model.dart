class DetectedInstance {
  String name = '';
  List<dynamic> pos = [0, 0];
  DetectedInstance();

  factory DetectedInstance.fromJson(Map<String, dynamic> json) {
    return DetectedInstance()
      ..name = json['name'] as String
      ..pos = json['pos'] as List<dynamic>;
  }
}

class Detected {
  List<dynamic> originalSize = [0, 0];
  List<DetectedInstance> predicts = [];
  Detected();

  factory Detected.fromJson(Map<String, dynamic> json) {
    return Detected()
      ..originalSize = json['original_size'] as List<dynamic>
      ..predicts = (json['predicts'] as List<dynamic>)
          .map((e) => DetectedInstance.fromJson(e as Map<String, dynamic>))
          .toList();
  }
}
