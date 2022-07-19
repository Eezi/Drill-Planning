import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:markdown_app/dbHelper/mongodb.dart';
import 'package:markdown_app/models/excercise.dart';

class AddWorkoutPage extends StatefulWidget {
  @override
  _AddWorkoutPageState createState() => _AddWorkoutPageState();
}

class _AddWorkoutPageState extends State<AddWorkoutPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final workout = ModalRoute.of(context)?.settings.arguments as Excercise?;

    var widgetText = 'Add Workout';

    if (workout != null) {
      nameController.text = workout.name;
      descriptionController.text = workout.description;
      widgetText = 'Update Workout';
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widgetText)
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(labelText: 'Name'),
                  )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: descriptionController,
                    decoration: InputDecoration(labelText: 'Description'),
                  )
                ),
              ],
            )
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 4.0),
              child: ElevatedButton(
                child: Text(widgetText),
                onPressed: () {
                  if (workout != null) {
                    updateWorkout(workout);
                  } else {
                    insertWorkout();
                  }
                },
              ),
            ),
          ),
        ],
      )
    );
  }
  void insertWorkout() async {
    final newWorkout = Excercise(
      M.ObjectId(),
      nameController.text,
      descriptionController.text
    );
    await MongoDatabase.createWorkout(newWorkout);
    Navigator.pop(context);
  }

  void updateWorkout(workout) async {
    final updatedWorkout = Excercise(
      workout.id,
      nameController.text,
      descriptionController.text,
    );

    await MongoDatabase.updateWorkout(updatedWorkout);
    Navigator.pop(context);
  }
}
