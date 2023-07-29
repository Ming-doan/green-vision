class Recommend {
  String title = '';
  String content = '';
  List<String> paths = [];
  Recommend();

  factory Recommend.fromJson(Map<String, dynamic> json) {
    return Recommend()
      ..title = json['title'] as String
      ..content = json['content'] as String
      ..paths =
          (json['path'] as List<dynamic>).map((e) => e as String).toList();
  }
}

class RecommendList {
  List<Recommend> recommends = [];
  RecommendList();

  factory RecommendList.fromJson(Map<String, dynamic> json) {
    return RecommendList()
      ..recommends = (json['recommends'] as List<dynamic>)
          .map((e) => Recommend.fromJson(e as Map<String, dynamic>))
          .toList();
  }
}
