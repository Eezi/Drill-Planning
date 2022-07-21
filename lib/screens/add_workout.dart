import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:markdown_app/dbHelper/mongodb.dart';
import 'package:markdown_app/models/excercise.dart';
import 'package:markdown_app/models/intensity.dart';
import 'dart:convert';

class AddWorkoutPage extends StatefulWidget {
  @override
  _AddWorkoutPageState createState() => _AddWorkoutPageState();
}

class _AddWorkoutPageState extends State<AddWorkoutPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  List<Intensity> intensityOptions = [Intensity(false, 'Hard'), Intensity(false, 'Medium'), Intensity(false, 'Easy')];
  bool stateInit = false;

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
      var intensityIndex = intensityOptions.map((i) => i.label).toList().indexOf(workout.intensity);

      if (intensityIndex >= 0 && stateInit == false) {
        intensityOptions[intensityIndex].value = true; 
      }

      nameController.text = workout.name;
      descriptionController.text = workout.description;
      widgetText = 'Update Workout';
      stateInit = true;
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
                ToggleButtons(
                 children: intensityOptions.map((i) => new Text(i.label.toString())).toList()
                ,
                onPressed: (int index) {
                setState(() {
                  for (int buttonIndex = 0; buttonIndex < intensityOptions.length; buttonIndex++) {
                    print("value ${intensityOptions[buttonIndex].value} ");
                   if (buttonIndex == index) {
                    intensityOptions[buttonIndex].value = true;
                  } else {
                    intensityOptions[buttonIndex].value = false;
                  }
              }
            });
              },
              isSelected: intensityOptions.map((i) => i.value).toList(),
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
    var selectedIntensity = intensityOptions.firstWhere((i) => i.value == true).label;
    print("CREATE: $selectedIntensity");
    final newWorkout = Excercise(
      M.ObjectId(),
      nameController.text,
      descriptionController.text,
      selectedIntensity,
    );
    await MongoDatabase.createWorkout(newWorkout);
    Navigator.pop(context);
  }

  void updateWorkout(workout) async {
    var selectedIntensity = intensityOptions.firstWhere((i) => i.value == true).label;
    print("UPDATE: $selectedIntensity");

    final updatedWorkout = Excercise(
      workout.id,
      nameController.text,
      descriptionController.text,
      selectedIntensity,
    );

    await MongoDatabase.updateWorkout(updatedWorkout);
    Navigator.pop(context);
  }
}
