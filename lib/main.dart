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
  var categories;
  var categoriesData;

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
      categories =
          recipes
              .map<String>((recipe) => recipe['category'] as String)
              .toSet()
              .toList();
    });
  }

  List<Map<String, dynamic>> _recipesOfCategory(
    Map<String, dynamic> data,
    String category,
  ) {
    return data['recipes']
        .where((recipe) => recipe['category'] == category)
        .map<Map<String, dynamic>>((recipe) => recipe as Map<String,dynamic>)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(title: const Text('Cuisine Categories')),
        body: Center(
          child:
              categories != null
                  ? ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return ListTile(
                        title: Text(category),
                        trailing: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder:
                                    (context) => CuisinePage(
                                      recipesFromCategory: _recipesOfCategory(jsonData, category),
                                      categoryName: category
                                    ),
                              ),
                            );
                          },
                          child: Container(
                            width: 48,
                            height: 48,
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.arrow_forward),
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

