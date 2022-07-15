import 'package:flutter/material.dart';
import 'package:markdown_app/components/drawer.dart';
import 'package:markdown_app/components/bottomNavigation.dart';

class MyTabbedPage extends StatefulWidget {
  const MyTabbedPage({ Key? key }) : super(key: key);
  @override
  State<MyTabbedPage> createState() => _MyTabbedPageState();
}

class _MyTabbedPageState extends State<MyTabbedPage> with SingleTickerProviderStateMixin {
  late TextEditingController _controller;
  List<String> exercises = [];

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController();
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
          onPressed: () async{
             final name = await openDialog();
             if (name == null || name.isEmpty) return;
             setState(() => this.exercises.add(name));
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
        child: ListView.builder(
          itemCount: exercises.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(exercises[index]),
            );
          },
        ),
      ),
    );
  }

Future openDialog() => showDialog(
  context: context,
  builder: (context) => AlertDialog(
    title: Text("Harjoituksen nimi"),
    content: TextField(
      controller: _controller,
      autofocus: true,
      decoration: InputDecoration(hintText: 'Lisää harjoituksesi nimi' ),
    ),
    actions: [
      TextButton(
        child: Text("Lisää"),
        onPressed: submit,
      )
    ]
  )
);

  void submit() {
    Navigator.of(context).pop(_controller.text);
    _controller.clear();
  }
}

