import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lenguo_app/core/common_wedgets/custom_button.dart';
import 'package:lenguo_app/core/theme/app_colors.dart';
import 'package:lenguo_app/core/theme/app_text_style.dart';
import 'package:lenguo_app/features/language_selection/domain/entity/language_selection_entity.dart';
import 'package:lenguo_app/features/language_selection/presentation/cubit/language_selection_cubit.dart';
import 'package:lenguo_app/features/language_selection/presentation/cubit/language_selection_state.dart';
import 'package:lenguo_app/features/language_selection/presentation/ui/widgets/container_selection.dart';
import 'package:lenguo_app/features/vocablaries/presentation/ui/screens/categories_screen.dart';

class SelectionScreen extends StatefulWidget {
  final bool isFirstSelection;

  const SelectionScreen({super.key, this.isFirstSelection = true});

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  @override
  void initState() {
    super.initState();

    if (widget.isFirstSelection) {
      context.read<LanguageSelectionCubit>().getSelectedLanguage();
    }
  }

  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LanguageSelectionCubit>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        iconTheme: const IconThemeData(color: AppColors.primaryColor),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocListener<LanguageSelectionCubit, LanguageSelectionState>(
          listener: (context, state) {
            // أول مرة فقط:
            // لو فيه لغة محفوظة، نروح للـ Categories مباشرة
            if (widget.isFirstSelection && state is LanguageSelectionSuccess) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const CategoriesScreen()),
              );
            }
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),

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

                const SizedBox(height: 20),

                // Arabic
                ContainerSelection(
                  photoPath: 'assets/images/egyptFlag.png',
                  title: "Learn Arabic",
                  subtitle1: "Arabic --> English",
                  subtitle2: "تعلم العربية",
                  isSelected: selectedIndex == 0,
                  onTap: () async {
                    setState(() {
                      selectedIndex = 0;
                    });
                    await cubit.setSelectedLanguage(
                      LanguageSelectionEntity(
                        languageCode: "ar",
                        languageName: "Arabic",
                      ),
                    );
                  },
                ),

                const SizedBox(height: 10),

                // English
                ContainerSelection(
                  photoPath: 'assets/images/englishFlag.png',
                  title: "Learn English",
                  subtitle1: "English --> Arabic",
                  subtitle2: "تعلم الانجليزية",
                  isSelected: selectedIndex == 1,
                  onTap: () async {
                    setState(() {
                      setState(() {
                        selectedIndex = 1;
                      });
                    });
                    await cubit.setSelectedLanguage(
                      LanguageSelectionEntity(
                        languageCode: "en",
                        languageName: "English",
                      ),
                    );
                  },
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.2),

                CustomButton(
                  onPressed: () async {
                    await cubit.getSelectedLanguage();

                    if (!context.mounted) return;

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CategoriesScreen(),
                      ),
                    );
                  },
                  text: "Continue",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
