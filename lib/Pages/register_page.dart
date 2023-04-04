
// ignore_for_file: unnecessary_const

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_page/components/square_tile_apple.dart';

import '../components/my_button.dart';
import '../components/my_textfields.dart';
import '../components/square_tiles.dart';
import '../services/auth_services.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;

  RegisterPage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUpUser() async{
    // loading cicle
    showDialog(
        context: context,
        builder: (context){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
    );
    
    // try creating an account
    
    try {
      
      //checking if password matches with confirm passoword
      
      if(passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        showErroMessage("Password don't match");
      }
      Navigator.pop(context);
    } on FirebaseAuthException catch(e){
      // loading circle
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
            title: Text(message),
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
                SizedBox(height: 20,),

                // my top icon

                const Icon(
                  Icons.lock,
                  size: 100,
                ),
                SizedBox(height: 20,),


                const Center(
                  child: Text(
                    'Let \'s create an account for you!',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: 40,),
                //Email Textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obsureText: false,
                ),

                SizedBox(height: 10,),

                //Password Textfield

                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obsureText: true,
                ),
                SizedBox(height: 10,),

                // confirm password

                MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm password',
                  obsureText: true,
                ),

                SizedBox(height: 25,),

                // Sign in button

                MyButton(
                  text: 'Sign Up',
                  onTap: signUpUser,
                ),
                SizedBox(height: 20,),

                // continue with divider

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
                SizedBox(height: 25,),
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
                SizedBox(height: 35,),
                // Not a member
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Text(
                      'Already a Member? ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),
                    ),
                    // login Now
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text('Login Now',
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

