import 'package:flutter/material.dart';
import 'package:lenguo_app/features/grammar/presentation/ui/screens/grammer_categories_screen.dart';
import 'package:lenguo_app/features/vocablaries/presentation/ui/screens/categories_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CategoriesScreen()),
              );
            },
            child: Text('categories'),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => GrammerCategoriesScreen()),
              );
            },
            child: Text('Grammar'),
          ),
        ],
      ),
    );
  }
}
