import 'package:flutter/material.dart';
import 'package:markdown_app/screens/Register/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
          Text('Log In', style: TextStyle(fontSize: 20),),
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
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.deepPurple, borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  )
                ),
              ),
            )
          ),
          SizedBox(height: 25,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Not a member?',
                style: TextStyle(fontWeight: FontWeight.bold), 
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                       return RegisterPage();
                      },
                      ));
                },
                child: Text(' Register now',
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
}