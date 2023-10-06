import 'package:flutter/material.dart';
import 'package:snake/snake.dart';

void main() {
  runApp(const Snake_Game());
}

class Snake_Game extends StatelessWidget {
  const Snake_Game({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Snake(),
    );
  }
}
