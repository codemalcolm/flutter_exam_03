import 'package:flutter/material.dart';

class IngredientsPage extends StatefulWidget {
  const IngredientsPage({
    super.key,
    required this.ingredients,
    required this.foodName,
  });

  final List<dynamic> ingredients;
  final String foodName;

  @override
  State<IngredientsPage> createState() => _MyAppState();
}

class _MyAppState extends State<IngredientsPage> {
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
          title: Text(widget.foodName),
        ),
        body: Center(
          child:
              widget.ingredients != null
                  ? ListView.builder(
                    itemCount: widget.ingredients.length,
                    itemBuilder: (context, index) {
                      final recipe = widget.ingredients[index];
                      return ListTile(title: Text(recipe));
                    },
                  )
                  : Text('Loading recipes...'),
        ),
      ),
    );
  }
}
