import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:lenguo_app/core/di/injection.dart';
import 'package:lenguo_app/core/language/current_language.dart';
import 'package:lenguo_app/core/theme/app_colors.dart';
import 'package:lenguo_app/core/theme/app_text_style.dart';
import 'package:lenguo_app/features/vocablaries/domain/entity/vocablaries_entity.dart';
import 'package:lenguo_app/features/vocablaries/presentation/ui/widgets/photo_container.dart';
import 'package:lenguo_app/features/vocablaries/presentation/ui/widgets/word_details.dart';

class VocabularyDetailsScreen extends StatefulWidget {
  final VocablariesEntity vocabulary;

  const VocabularyDetailsScreen({super.key, required this.vocabulary});

  @override
  State<VocabularyDetailsScreen> createState() =>
      _VocabularyDetailsScreenState();
}

class _VocabularyDetailsScreenState extends State<VocabularyDetailsScreen> {
  final FlutterTts flutterTts = FlutterTts();

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vocabulary = widget.vocabulary;
    final currentLanguage = sl<CurrentLanguage>();
    final isArabic = currentLanguage.languageCode == 'ar';

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          isArabic ? vocabulary.translation : vocabulary.word,
          style: AppTextStyle.loginAndRegisterTitle,
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.primaryColor),
        backgroundColor: AppColors.backgroundColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PhotoContainer(url: vocabulary.imageUrl),
            const SizedBox(height: 24),
            WordDetails(
              word: isArabic ? vocabulary.translation : vocabulary.word,
              translation: isArabic ? vocabulary.word : vocabulary.translation,
              onPressed: () {
                _speakWord(
                  flutterTts,
                  isArabic ? vocabulary.translation : vocabulary.word,
                  isArabic ? 'ar' : 'en-US',
                );
              },
              example: vocabulary.example,
              exampleTranslation: vocabulary.exampleTranslation,
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _speakWord(
  FlutterTts flutterTts,
  String word,
  String language,
) async {
  await flutterTts.stop();
  await flutterTts.setLanguage(language);
  await flutterTts.speak(word);
}
