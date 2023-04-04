import 'package:flutter/material.dart';

class SquareTileApple extends StatelessWidget {
  final String imagePathApple;
  const SquareTileApple({Key? key, required this.imagePathApple}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(16),
          color: Colors.black

      ),

      child: Image.asset(imagePathApple,
        height: 40,
      ),
    );
  }
}
