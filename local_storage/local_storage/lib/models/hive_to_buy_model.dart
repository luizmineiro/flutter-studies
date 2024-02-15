import 'package:hive/hive.dart';

part 'hive_to_buy_model.g.dart';

@HiveType(typeId: 0)
class HiveToBuyModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;

  HiveToBuyModel({
    required this.id,
    required this.title,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
    };
  }

  factory HiveToBuyModel.fromMap(Map<String, dynamic> map) {
    return HiveToBuyModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
    );
  }
  factory HiveToBuyModel.fromMapToSQL(Map<String, dynamic> map) {
    return HiveToBuyModel(
      id: map['id'].toString(),
      title: map['title'],
      description: map['description'],
    );
  }
}
