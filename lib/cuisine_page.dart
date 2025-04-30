import 'package:flutter/material.dart';
import 'package:flutter_exam_3/ingredients_page.dart';

class CuisinePage extends StatefulWidget {
  const CuisinePage({
    super.key,
    required this.recipesFromCategory,
    required this.categoryName,
  });

  final List<Map<String, dynamic>> recipesFromCategory;
  final String categoryName;

  @override
  State<CuisinePage> createState() => _MyAppState();
}

class _MyAppState extends State<CuisinePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
          title: Text("${widget.categoryName.capitalize()} Food"),
        ),
        body: Center(
          child:
              widget.recipesFromCategory != null
                  ? ListView.builder(
                    itemCount: widget.recipesFromCategory.length,
                    itemBuilder: (context, index) {
                      final recipe = widget.recipesFromCategory[index];
                      return ListTile(
                        title: Text(recipe['name']),
                        trailing: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder:
                                    (context) => IngredientsPage(
                                      ingredients: recipe['ingredients'],
                                      foodName: recipe['name'],
                                    ),
                              ),
                            );
                          },
                          child: Text(
                            'See Ingredients',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                              fontSize: 14,
                            ),
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

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}
