import 'package:flutter/material.dart';
import 'package:markdown_app/dbHelper/mongodb.dart';
import 'package:markdown_app/screens/home.dart';
import 'package:markdown_app/dbHelper/mongodb.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: MyTabbedPage()),
  );
}
