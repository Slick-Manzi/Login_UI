import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obsureText;
  const MyTextField({Key? key,
    required this.controller,
    required this.hintText, required this.obsureText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
          child: TextField(
            controller: controller,
            obscureText: obsureText,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey),
                  borderRadius: BorderRadius.circular(12)
              ),
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey[500]),
              fillColor: Colors.grey[200],
              filled: true,
            ),
          )
      ),
    );
  }
}
