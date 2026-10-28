import 'package:flutter/material.dart';
import 'package:lenguo_app/core/Lists/grammar_list.dart';
import 'package:lenguo_app/core/theme/app_colors.dart';
import 'package:lenguo_app/features/grammar/presentation/ui/screens/grammar_details_screen.dart';
import 'package:lenguo_app/features/grammar/presentation/ui/widgets/grammar_container.dart';

class GrammerCategoriesScreen extends StatelessWidget {
  const GrammerCategoriesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(color: AppColors.primaryColor)),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return GrammarContainer(
            name: GrammarList.categories[index]['name']!,
            nameAr: GrammarList.categories[index]['nameAr']!,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => GrammarScreen(
                    name: GrammarList.categories[index]['category']!,
                  ),
                ),
              );
            },
          );
        },
        itemCount: GrammarList.categories.length,
      ),
    );
  }
}
