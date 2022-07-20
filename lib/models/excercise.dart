import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';

class Excercise {
  final ObjectId id;
  final String name;
  final String description;
  final String intensity;

  const Excercise(this.id, this.name, this.description, this.intensity);

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'description': description,
      'intensity': intensity,
    };
  }

  Excercise.fromMap(Map<String, dynamic> map)
      : id = map['_id'],
      name = map['name'],
      description = map['description'],
      intensity = map['intensity'];
}
