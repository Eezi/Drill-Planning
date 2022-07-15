import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {

@override
Widget build(BuildContext context) {
  return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            leading: Icon(
              Icons.fitness_center,
            ),
            title: const Text('Harjoitukset'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.calendar_month_rounded,
            ),
            title: const Text('Suunnitelma'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
