import 'package:flutter/material.dart';
import 'package:flutter_exam_3/ingredients_page.dart';

class CuisinePage extends StatelessWidget {
  const CuisinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Cuisine Page")),
        body: Column(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Go back to category page"),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const IngredientsPage(),
                    ),
                  );
                },
                child: Text("Go to ingredients page"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
