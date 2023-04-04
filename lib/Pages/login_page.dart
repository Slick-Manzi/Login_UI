
// ignore_for_file: unnecessary_const

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_page/components/square_tile_apple.dart';

import '../components/my_button.dart';
import '../components/my_textfields.dart';
import '../components/square_tiles.dart';
import '../services/auth_services.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;

  LoginPage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signInUser() async{
    // loading circle or waiting circle
    showDialog(
        context: context,
        builder: (context){
      return Center(
        child: CircularProgressIndicator(),
      );
      }
    );
    // try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,

      );
      Navigator.pop(context);
    } on FirebaseAuthException catch(e){
      Navigator.pop(context);
      // error codes
      showErroMessage(e.code);

    };
  }
  // error message to the user
  void showErroMessage(String message) async {
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text(message,),
          );
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 25,),
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
                SizedBox(height: 30,),
                const Center(
                  child: Text(
                    'Welcome back you\ ve been missed!!',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: 50,),
                //Email Textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obsureText: false,
                ),

                SizedBox(height: 15,),
                //Password Textfield
                 MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obsureText: true,
                ),

                // Forgot password
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Forgot Password?',
                      style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 15,),
                // Sign in
                MyButton(
                  text: 'Sign In',
                  onTap: signInUser,
                ),
                SizedBox(height: 40,),

               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
                 child: Row(
                   children: [
                     Expanded(
                       child: Divider(
                         thickness: 1,
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: Text('Or continue with',
                       style: TextStyle(
                         color: Colors.grey[700]
                       ),
                       ),
                     ),
                     Expanded(
                       child: Divider(
                         thickness: 1,
                       ),
                     ),
                   ],
                 ),
               ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Microsoft icon
                    SquareTile(
                      onTap: () => AuthService().singInWithGoogle(),
                      imagePath: 'lib/images/google.jpeg',
                    ),
                    SizedBox(width: 15,),
                    // Apple icon
                    SquareTileApple(
                      imagePathApple: 'lib/images/apple.jpeg',
                    )
                  ],
                ),
                SizedBox(height: 40,),
                // Not a member
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Text(
                      'Not a Member? ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),
                    ),
                    // Register Now
                     GestureDetector(
                      onTap: widget.onTap,
                      child: Text('Register Now',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 15
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            )
        ),
      ),

    );
  }
}

