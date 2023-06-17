// import 'dart:convert';
//
// ProgramModel programModelFromJson(String str) => ProgramModel.fromJson(json.decode(str));
//
// String programModelToJson(ProgramModel data) => json.encode(data.toJson());
//
// class ProgramModel {
//   String requestId;
//   Item items;
//   int count;
//   String anyKey;
//
//   ProgramModel({
//     required this.requestId,
//     required this.items,
//     required this.count,
//     required this.anyKey,
//   });
//
//   factory ProgramModel.fromJson(Map<String, dynamic> json) => ProgramModel(
//     requestId: json["requestId"],
//     items: Item.fromJson(json["items"]),
//     count: json["count"],
//     anyKey: json["anyKey"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "requestId": requestId,
//     "items": items.toJson(),
//     "count": count,
//     "anyKey": anyKey,
//   };
// }
//
// class Item {
//   DateTime createdAt;
//   String name;
//   String category;
//   int lesson;
//   String id;
//
//   Item({
//     required this.createdAt,
//     required this.name,
//     required this.category,
//     required this.lesson,
//     required this.id,
//   });
//
//   factory Item.fromJson(Map<String, dynamic> json) => Item(
//     createdAt: DateTime.parse(json["createdAt"]),
//     name: json["name"],
//     category: json["category"],
//     lesson: json["lesson"],
//     id: json["id"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "createdAt": createdAt.toIso8601String(),
//     "name": name,
//     "category": category,
//     "lesson": lesson,
//     "id": id,
//   };
// }


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

