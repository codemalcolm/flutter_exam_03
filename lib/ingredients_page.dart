
import 'package:flutter/material.dart';

void main() {
  runApp(const IngredientsPage());
}

class IngredientsPage extends StatelessWidget {
  const IngredientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Ingredients Page"),
        ),
        body: Center(
          child: Text('Hello Ingredients Page!'),
        ),
      ),
    );
  }
}
