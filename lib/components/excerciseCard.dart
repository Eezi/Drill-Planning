import 'package:flutter/material.dart';
import 'package:markdown_app/models/excercise.dart';

class ExcerciseCard extends StatelessWidget {
  //ExcerciseCard(this.execercise, this.onTapDelete, this.onTapEdit);
  const ExcerciseCard ({
    super.key,
    required this.execercise,
    required this.onTapEdit,
    required this.onTapDelete,
  });

  final Excercise execercise;
  final VoidCallback onTapEdit, onTapDelete;

  @override
  Widget build(BuildContext context) {
  bool intensityExists = execercise.intensity != null && execercise.intensity != '';

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
        execercise.intensity[0].toUpperCase(),
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      backgroundColor: 
      execercise.intensity == 'Hard' ? Colors.red : execercise.intensity == 'Easy' ? Colors.blue : Colors.yellow,
      //elevation: 2.0,
      shadowColor: Colors.grey[60],
      padding: EdgeInsets.all(9.0),
    ) : null,
        title: Text(execercise.name),
        subtitle: Text('${execercise.description}'),
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
