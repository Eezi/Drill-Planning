import 'package:flutter/material.dart';
import 'package:markdown_app/components/drawer.dart';
import 'package:markdown_app/components/bottomNavigation.dart';
import 'package:markdown_app/components/workoutCard.dart';
import 'package:markdown_app/dbHelper/mongodb.dart';
import 'package:markdown_app/models/workout.dart';
import 'package:markdown_app/screens/add_workout.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           Navigator.push(context,
           MaterialPageRoute(builder: (BuildContext context) {
             return AddWorkoutPage();
           })).then((value) => setState(() {}));
          },
        child: Icon(Icons.add),
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
                      child: WorkoutCard(
                        workout: Workout.fromMap(snapshot.data[index]),

                        onTapDelete: () async {
                         _deleteWorkout(Workout.fromMap(snapshot.data[index]));
                        },

                        onTapEdit: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return AddWorkoutPage();
                              },
                              settings: RouteSettings(
                                arguments: Workout.fromMap(snapshot.data[index]),
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

  _deleteWorkout(Workout workout) async {
    await MongoDatabase.deleteWorkout(workout);
    setState(() {});
  }
}

