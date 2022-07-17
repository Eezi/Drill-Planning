import 'package:mongo_dart/mongo_dart.dart';
import 'package:markdown_app/dbHelper/constants.dart';
import 'package:markdown_app/models/excercise.dart';

class MongoDatabase {
  static var db, workoutsCollection;

  static connect() async {
    db = await Db.create(MONGO_URL);
    await db.open();
    workoutsCollection = db.collection(WORKOUT_COLLECTION);
  }

  static Future<List<Map<String, dynamic>>> getAllWorkouts() async {
    try {
      final workouts = await workoutsCollection.find().toList();
      return workouts;
    } catch(error) {
      print('Error [getAllWorkouts]: $error');
      return Future.error(error);
    }
  }
}
