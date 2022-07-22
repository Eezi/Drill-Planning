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
        leading: intensityExists ? CircleAvatar(
            radius: 17,
            backgroundColor: workout.intensity == 'Hard' ? Colors.red : workout.intensity == 'Easy' ? Colors.blue : Colors.yellow,
            child: CircleAvatar(
                  radius: 15,
                  backgroundColor: workout.intensity == 'Hard' ? Color.fromARGB(255, 254, 192, 192) : workout.intensity == 'Easy' ? Color.fromARGB(255, 201, 234, 249)
                  : Color.fromARGB(255, 255, 255, 194),
                  child: Text(
                  workout.intensity[0].toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),

              ),
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
