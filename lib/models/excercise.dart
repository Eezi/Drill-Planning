import 'package:mongo_dart/mongo_dart.dart';

class Excercise {
  final ObjectId id;
  final String name;
  final String description;

  const Excercise(this.id, this.name, this.description);

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'description': description,
    };
  }

  Excercise.fromMap(Map<String, dynamic> map)
      : id = map['_id'],
      name = map['name'],
      description = map['description'];
}
