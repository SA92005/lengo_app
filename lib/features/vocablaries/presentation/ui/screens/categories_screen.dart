import 'package:flutter/material.dart';
import 'package:lenguo_app/core/di/injection.dart';
import 'package:lenguo_app/core/language/current_language.dart';
import 'package:lenguo_app/core/theme/app_colors.dart';
import 'package:lenguo_app/features/language_selection/presentation/ui/screens/selection_screen.dart';
import 'package:lenguo_app/features/vocablaries/presentation/ui/category_list.dart';
import 'package:lenguo_app/features/vocablaries/presentation/ui/screens/vocabs_screen.dart';
import 'package:lenguo_app/features/vocablaries/presentation/ui/widgets/category_container.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  final List<Map<String, String>> categories = CategoryList.categories;

  @override
  Widget build(BuildContext context) {
    final currentLanguage = sl<CurrentLanguage>();
    final isArabic = currentLanguage.languageCode == 'ar';

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(),
      drawer: Drawer(
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => SelectionScreen(isFirstSelection: false),
              ),
            );
          },
          child: Text('change lang'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            final category = categories[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        VocabularyWordsScreen(category: category['category']!),
                  ),
                );
              },
              child: CategoryContainer(
                categoryName: isArabic
                    ? category['nameAr']!
                    : category['name']!,
                categoryIcon: category['icon']!,
              ),
            );
          },
          itemCount: categories.length,
        ),
      ),
    );
  }
}
