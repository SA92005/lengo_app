import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lenguo_app/core/di/injection.dart';
import 'package:lenguo_app/core/language/current_language.dart';
import 'package:lenguo_app/core/theme/app_colors.dart';
import 'package:lenguo_app/core/theme/app_text_style.dart';
import 'package:lenguo_app/features/vocablaries/presentation/cubit/vocablaries_cubit.dart';
import 'package:lenguo_app/features/vocablaries/presentation/cubit/vocablaries_states.dart';
import 'package:lenguo_app/features/vocablaries/presentation/ui/screens/vocab_details_screen.dart';
import 'package:lenguo_app/features/vocablaries/presentation/ui/widgets/word_container.dart';

class VocabularyWordsScreen extends StatefulWidget {
  final String category;

  const VocabularyWordsScreen({super.key, required this.category});

  @override
  State<VocabularyWordsScreen> createState() => _VocabularyWordsScreenState();
}

class _VocabularyWordsScreenState extends State<VocabularyWordsScreen> {
  @override
  void initState() {
    super.initState();

    context.read<VocabulariesCubit>().getVocabsByCategory(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    final currentLanguage = sl<CurrentLanguage>();
    final isArabic = currentLanguage.languageCode == 'ar';
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.primaryColor),
        title: Text(widget.category, style: AppTextStyle.loginAndRegisterTitle),
        centerTitle: true,
      ),
      body: BlocBuilder<VocabulariesCubit, VocabulariesState>(
        builder: (context, state) {
          if (state is VocabulariesLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is VocabulariesFailure) {
            return Center(child: Text(state.message));
          }

          if (state is VocabulariesSuccess) {
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.vocabularies.length,
              itemBuilder: (context, index) {
                final vocabulary = state.vocabularies[index];

                return WordContainer(
                  url: vocabulary.imageUrl,
                  word: isArabic ? vocabulary.translation : vocabulary.word,
                  translation: isArabic
                      ? vocabulary.word
                      : vocabulary.translation,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            VocabularyDetailsScreen(vocabulary: vocabulary),
                      ),
                    );
                  },
                );
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
