import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lenguo_app/core/theme/app_colors.dart';
import 'package:lenguo_app/core/theme/app_text_style.dart';
import 'package:lenguo_app/features/grammar/presentation/cubit/grammar_cubit.dart';
import 'package:lenguo_app/features/grammar/presentation/cubit/grammar_states.dart';
import 'package:lenguo_app/features/grammar/presentation/ui/widgets/grammar_arabic_text.dart';
import 'package:lenguo_app/features/grammar/presentation/ui/widgets/grammar_info_container.dart';
import 'package:lenguo_app/features/grammar/presentation/ui/widgets/grammar_list_maping.dart';
import 'package:lenguo_app/features/grammar/presentation/ui/widgets/grammar_section_title.dart';

class GrammarScreen extends StatefulWidget {
  final String name;

  const GrammarScreen({super.key, required this.name});

  @override
  State<GrammarScreen> createState() => _GrammarScreenState();
}

class _GrammarScreenState extends State<GrammarScreen> {
    @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<GrammarCubit>().getGrammar(widget.name);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GrammarCubit, GrammarState>(
      builder: (context, state) {
        debugPrint('GrammarScreen state: ${state.runtimeType}');
        if (state is GrammarLoading) {
          print('grammar loading');
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is GrammarError) {
          return Scaffold(
            body: Center(
              child: Text(
                state.message,
                style: AppTextStyle.loginAndRegisterSubtitle,
              ),
            ),
          );
        }

        if (state is GrammarSuccess) {
          print('grammar sucess');
          final grammar = state.grammar;

          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            appBar: AppBar(
              backgroundColor: AppColors.backgroundColor,
              iconTheme: const IconThemeData(color: AppColors.primaryColor),
              centerTitle: true,
              title: Text(
                grammar.nameAr,
                style: AppTextStyle.loginAndRegisterTitle,
              ),
            ),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.primaryColor, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.lightPrimaryColor,
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      grammar.nameAr,
                      style: AppTextStyle.loginAndRegisterTitle,
                    ),

                    Text(
                      grammar.name,
                      style: AppTextStyle.loginAndRegisterSubtitle,
                    ),

                    const SizedBox(height: 8),

                    GrammarArabicText(
                      text: grammar.explanation,
                      alignment: AlignmentGeometry.centerRight,
                      textDirection: TextDirection.rtl,
                    ),

                    const SizedBox(height: 24),

                    GrammarSectionTitle(title: 'الاستخدامات'),

                    const SizedBox(height: 10),

                    GrammarListMaping(
                      items: grammar.uses,
                      bullet: true,
                      alignment: AlignmentGeometry.bottomRight,
                      textDirection: TextDirection.rtl,
                    ),

                    const SizedBox(height: 20),

                    GrammarSectionTitle(title: 'التكوين'),

                    const SizedBox(height: 10),

                    Text(
                      grammar.structure.iYouWeThey,
                      style: AppTextStyle.loginAndRegisterSubtitle,
                    ),

                    const SizedBox(height: 8),

                    Text(
                      grammar.structure.heSheIt,
                      style: AppTextStyle.loginAndRegisterSubtitle,
                    ),

                    const SizedBox(height: 24),

                    GrammarSectionTitle(title: 'قواعد الافعال'),

                    const SizedBox(height: 10),

                    ...grammar.verbRules.map(
                      (rule) => GrammarInfoContainer(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GrammarArabicText(
                              text: rule.rule,
                              alignment: AlignmentGeometry.centerRight,
                              textDirection: TextDirection.rtl,
                            ),

                            const SizedBox(height: 6),

                            Text(
                              rule.form,
                              style: AppTextStyle.loginAndRegisterSubtitle,
                            ),

                            const SizedBox(height: 8),

                            GrammarListMaping(
                              items: rule.examples,
                              alignment: AlignmentGeometry.centerLeft,
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    GrammarSectionTitle(title: 'الكلمات الدالة عليه'),

                    const SizedBox(height: 10),

                    ...grammar.signalWords.map(
                      (signalWord) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          '${signalWord.english} - ${signalWord.arabic}',
                          style: AppTextStyle.loginAndRegisterSubtitle,
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    GrammarSectionTitle(title: 'امثلة'),

                    const SizedBox(height: 10),

                    ...grammar.examples.map(
                      (example) => GrammarInfoContainer(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              example.english,
                              style: AppTextStyle.loginAndRegisterSubtitle,
                            ),

                            const SizedBox(height: 6),

                            GrammarArabicText(
                              text: example.arabic,
                              alignment: AlignmentGeometry.centerRight,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        return const Scaffold(body: SizedBox.shrink());
      },
    );
  }
}
