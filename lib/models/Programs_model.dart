class ProgramModel {
  DateTime createdAt;
  String name;
  String category;
  int lesson;
  String id;

  ProgramModel({
    required this.createdAt,
    required this.name,
    required this.category,
    required this.lesson,
    required this.id,
  });

  factory ProgramModel.fromJson(dynamic json){
    return ProgramModel(
      createdAt: DateTime.parse(json['createdAt'] as String),
      name: json['name'] as String,
      category: json['category'] as String,
      lesson: json['lesson'] as int,
      id: json['id'] as String
    );
  }

  static List<ProgramModel> programsFromSnapshot(List snapshot){
    return snapshot.map(
        (data){
          return ProgramModel.fromJson(data);
        }).toList();
  }
}

