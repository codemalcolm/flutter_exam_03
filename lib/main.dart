import 'package:flutter/material.dart';
import 'cuisine_page.dart';

void main() {
  runApp(MaterialApp(home: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Categories Page")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const CuisinePage()),
            );
          },
          child: Text('Open cuisine screen'),
        ),
      ),
    );
  }
}
