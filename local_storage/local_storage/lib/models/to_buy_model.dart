class ToBuyModel {
  final String id;
  final String title;
  final String description;

  ToBuyModel({
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

  factory ToBuyModel.fromMap(Map<String, dynamic> map) {
    return ToBuyModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
    );
  }
  factory ToBuyModel.fromMapToSQL(Map<String, dynamic> map) {
    return ToBuyModel(
      id: map['id'].toString(),
      title: map['title'],
      description: map['description'],
    );
  }
}
