import 'package:flutter/material.dart';
import 'package:markdown_app/components/drawer.dart';
import 'package:markdown_app/components/bottomNavigation.dart';
import 'package:markdown_app/components/excerciseCard.dart';
import 'package:markdown_app/dbHelper/mongodb.dart';
import 'package:markdown_app/models/excercise.dart';
import 'package:markdown_app/screens/add_workout.dart';

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
    return FutureBuilder(
     future: MongoDatabase.getAllWorkouts(),
     builder: (context, AsyncSnapshot snapshot) {
       if (snapshot.connectionState == ConnectionState.waiting) {
         return Container(
              color: Colors.white,
              child: const LinearProgressIndicator(
                backgroundColor: Colors.black,
          )
        );
       } else if (snapshot.hasError) {
         return Container(
                color: Colors.white,
                child: Center(
                  child: Text(
                    'Something went wrong, try again.',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
            );
       } else {

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
      body: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ExcerciseCard(
                        execercise: Excercise.fromMap(snapshot.data[index]),

                        onTapDelete: () async {
                         //_deleteUser(User.fromMap(snapshot.data[index]));
                        },

                        onTapEdit: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return AddWorkoutPage();
                              },
                              settings: RouteSettings(
                                arguments: Excercise.fromMap(snapshot.data[index]),
                              ),
                            ),
                          ).then((value) => setState(() {}));
                        },
                      ),
                    );
                  },
                  itemCount: snapshot.data.length,
                ),    
            );
        }
      }
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

