import 'package:flutter/material.dart';
import 'package:markdown_app/screens/Login/login.dart';
import 'package:markdown_app/models/user.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;

class RegisterPage extends StatefulWidget {
  const RegisterPage({ Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text('Welcome', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
          Text('Register', style: TextStyle(fontSize: 20),),
          SizedBox(height: 50,),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Email'
                  ),
                ),
              ),
            ), 
          ),

          SizedBox(height: 15,),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Password'
                  ),
                ),
              ),
            ), 
          ),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: GestureDetector(
              onTap: () {
                createUser();
              },
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.deepPurple, borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),
                  ),
              ),
            )
            ),
          ),
          SizedBox(height: 25,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Already have a account?',
                style: TextStyle(fontWeight: FontWeight.bold), 
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                       return LoginPage();
                      },
                      ));
                },
                child: Text(' Log In',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue), 
              )
              )
            ],
          )
      ],
        )
      )
      )
    );

  }
  void createUser() async {
    final newUser = User(
      M.ObjectId(),
      emailController.text,
      passwordController.text,
    );
    print(newUser);
  }
}