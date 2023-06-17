class LessonModel {
  DateTime createdAt;
  String name;
  int duration;
  String category;
  bool locked;
  String id;

  LessonModel({
    required this.createdAt,
    required this.name,
    required this.duration,
    required this.category,
    required this.locked,
    required this.id,
  });

  factory LessonModel.fromJson(dynamic json){
    return LessonModel(
      createdAt: DateTime.parse(json['createdAt'] as String),
      name: json['name'] as String,
      duration: json['duration'] as int,
      category: json['category'] as String,
      locked : json['locked'] as bool,
      id: json['id'] as String
    );
  }

  static List<LessonModel> lessonsFromSnapshot(List snapshot){
    return snapshot.map(
            (data){
          return LessonModel.fromJson(data);
        }).toList();
  }
}