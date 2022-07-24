import 'package:mongo_dart/mongo_dart.dart';
import 'package:markdown_app/dbHelper/constants.dart';
import 'package:markdown_app/models/workout.dart';

class MongoDatabase {
  static var db, workoutsCollection;

  static connect() async {
    db = await Db.create(MONGO_URL);
    await db.open();
    workoutsCollection = db.collection(WORKOUT_COLLECTION);
  }

  static createWorkout(workout) async {
    await workoutsCollection.insertOne(workout.toMap());
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

  static updateWorkout(Workout workout) async {
    var workoutToUpdate = await workoutsCollection.findOne({"_id": workout.id});
    workoutToUpdate["name"] = workout.name;
    workoutToUpdate["description"] = workout.description;
    workoutToUpdate["intensity"] = workout.intensity;
    await workoutsCollection.save(workoutToUpdate);
  }

  static deleteWorkout(Workout workout) async {
    await workoutsCollection.remove(where.id(workout.id));
  }
}
