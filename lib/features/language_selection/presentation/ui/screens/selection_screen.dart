import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lenguo_app/core/common_wedgets/custom_button.dart';
import 'package:lenguo_app/core/theme/app_colors.dart';
import 'package:lenguo_app/core/theme/app_text_style.dart';
import 'package:lenguo_app/features/language_selection/domain/entity/language_selection_entity.dart';
import 'package:lenguo_app/features/language_selection/presentation/cubit/language_selection_cubit.dart';
import 'package:lenguo_app/features/language_selection/presentation/cubit/language_selection_state.dart';
import 'package:lenguo_app/features/language_selection/presentation/ui/widgets/container_selection.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LanguageSelectionCubit>();
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<LanguageSelectionCubit, LanguageSelectionState>(
          builder: (context, state) {
            if (state is LanguageSelectionError) {
              Center(child: Text(state.message));
            }
            if (state is LanguageSelectionLoading) {
              Center(child: CircularProgressIndicator());
            }
            //   if (state is LanguageSelectionSuccess)
            return Column(
              children: [
                Text(
                  "Choose Learning Direction",
                  style: AppTextStyle.loginAndRegisterTitle,
                  textAlign: TextAlign.center,
                ),
                Text(
                  "what do you want to learn?",
                  style: AppTextStyle.loginAndRegisterSubtitle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.0),
                ContainerSelection(
                  photoPath: 'assets/images/egyptFlag.png',
                  title: "Learn Arabic",
                  subtitle1: "Arabic --> English",
                  subtitle2: "تعلم العربية",
                  onTap: () async {
                    await cubit.setSelectedLanguage(
                      LanguageSelectionEntity(
                        languageCode: "ar",
                        languageName: "Arabic",
                      ),
                    );
                  },
                ),
                SizedBox(height: 10),
                ContainerSelection(
                  photoPath: 'assets/images/englishFlag.png',
                  title: "Learn English",
                  subtitle1: "English --> Arabic",
                  subtitle2: "تعلم الانجليزية",
                  onTap: () async {
                    final cubit = context.read<LanguageSelectionCubit>();
                    await cubit.setSelectedLanguage(
                      LanguageSelectionEntity(
                        languageCode: "en",
                        languageName: "English",
                      ),
                    );
                  },
                ),
                Spacer(),
                CustomButton(
                  onPressed: () async {
                    await cubit.getSelectedLanguage();
                  },
                  text: "Continue",
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
