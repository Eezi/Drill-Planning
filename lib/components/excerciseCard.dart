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
  final Function onTapEdit, onTapDelete;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.0,
      color: Colors.white,
      child: ListTile(
        /*leading: Text(
          // Tässä voisi olla harjoituksen insentiteetti mui pill 
          ${user.age}',
          style: Theme.of(context).textTheme.headline6,
        ),*/
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
