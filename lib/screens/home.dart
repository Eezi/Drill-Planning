import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:markdown_app/components/drawer.dart';
import 'package:markdown_app/components/bottomNavigation.dart';

class MyTabbedPage extends StatefulWidget {
  const MyTabbedPage({ Key? key }) : super(key: key);
  @override
  State<MyTabbedPage> createState() => _MyTabbedPageState();
}

class _MyTabbedPageState extends State<MyTabbedPage> with SingleTickerProviderStateMixin {
  String text = "";

  @override
  void initState() {
    super.initState();
  }

 @override
 void dispose() {
   super.dispose();
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      bottomNavigationBar: BottomMenu(),
      floatingActionButton:FloatingActionButton( //Floating action button on Scaffold
          onPressed: (){
              //code to execute on button press
          },
          child: Icon(Icons.send), //icon inside button
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        backgroundColor: Colors.black,
        //title: const Text("Markdown Editor", style: TextStyle(color: Colors.white)),
      ),
      body: Container(
            margin: EdgeInsets.all(20),
        ),
    );
  }
}
