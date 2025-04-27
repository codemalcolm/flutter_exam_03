import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'cuisine_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var jsonData;
  var recipes;

  @override
  void initState() {
    super.initState();
    loadJsonAsset();
  }

  Future<void> loadJsonAsset() async {
    final String jsonString = await rootBundle.loadString(
      'assets/data/mobile-apps-portfolio-03-recipes.json',
    );
    var data = await jsonDecode(jsonString);
    setState(() {
      jsonData = data;
      recipes = data["recipes"];
    });
    print(recipes);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(title: const Text('Loaded Data from Json File')),
        body: Center(
          child:
              recipes != Null
                  ? ListView.builder(
                    itemCount: recipes.length,
                    itemBuilder: (context, index) {
                      final recipe = recipes[index];
                      return ListTile(
                        title: Text(recipe['name']),
                        subtitle: Text(
                          'Recipe Category: ${recipe['category']}',
                        ),
                        trailing: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const CuisinePage()),);
                          },
                          child: Container(
                            width: 48,
                            height: 48,
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            alignment: Alignment.centerRight,
                            child: const CircleAvatar(),
                          ),
                        ),
                      );
                    },
                  )
                  : Text('Loading recipes...'),
        ),
      ),
    );
  }
}
