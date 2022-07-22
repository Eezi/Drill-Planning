import 'package:flutter/material.dart';
import 'package:markdown_app/models/workout.dart';

class WorkoutCard extends StatelessWidget {
  const WorkoutCard ({
    super.key,
    required this.workout,
    required this.onTapEdit,
    required this.onTapDelete,
  });

  final Workout workout;
  final VoidCallback onTapEdit, onTapDelete;

  @override
  Widget build(BuildContext context) {
  bool intensityExists = workout.intensity != null && workout.intensity != '';

    return Material(
      elevation: 2.0,
      color: Colors.white,
      child: ListTile(
        leading: intensityExists ? Chip(
      labelPadding: EdgeInsets.all(3.0),
      /*avatar: CircleAvatar(
        backgroundColor: Colors.white70,
        child: Text(execercise.intensity[0].toUpperCase()),
      ),*/
      label: Text(
        workout.intensity[0].toUpperCase(),
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      backgroundColor: 
      workout.intensity == 'Hard' ? Colors.red : workout.intensity == 'Easy' ? Colors.blue : Colors.yellow,
      //elevation: 2.0,
      shadowColor: Colors.grey[60],
      padding: EdgeInsets.all(9.0),
    ) : null,
        title: Text(workout.name),
        subtitle: Text('${workout.description}'),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              child: Icon(Icons.edit),
              onTap: onTapEdit,
            ),
            GestureDetector(
              child: Icon(Icons.delete),
              onTap: onTapDelete,
            ),
          ],
        ),
      ),
    );
  }
}
