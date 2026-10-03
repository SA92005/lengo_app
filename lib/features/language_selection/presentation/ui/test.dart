import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lenguo_app/features/language_selection/domain/entity/language_selection_entity.dart';
import 'package:lenguo_app/features/language_selection/presentation/cubit/language_selection_cubit.dart';
import 'package:lenguo_app/features/language_selection/presentation/cubit/language_selection_state.dart';

class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('LANGUAGE SCREEN OPENED');
    return Scaffold(
      appBar: AppBar(title: const Text('Language')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<LanguageSelectionCubit, LanguageSelectionState>(
          builder: (context, state) {
            String? selectedLanguage;

            if (state is LanguageSelectionSuccess) {
              selectedLanguage = state.language.languageCode;
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                const Text(
                  'Choose your language',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),

                const Text(
                  'Select your preferred language',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),

                const SizedBox(height: 30),

                _LanguageItem(
                  title: 'English',
                  languageCode: 'en',
                  isSelected: selectedLanguage == 'en',
                  onTap: () {
                    context.read<LanguageSelectionCubit>().setSelectedLanguage(
                      LanguageSelectionEntity(
                        languageCode: 'en',
                        languageName: 'English',
                      ),
                    );
                  },
                ),

                const SizedBox(height: 16),

                _LanguageItem(
                  title: 'العربية',
                  languageCode: 'ar',
                  isSelected: selectedLanguage == 'ar',
                  onTap: () {
                    context.read<LanguageSelectionCubit>().setSelectedLanguage(
                      LanguageSelectionEntity(
                        languageCode: 'ar',
                        languageName: 'Arabic',
                      ),
                    );
                  },
                ),

                const Spacer(),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: selectedLanguage == null
                        ? null
                        : () {
                            Navigator.pop(context);
                          },
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _LanguageItem extends StatelessWidget {
  final String title;
  final String languageCode;
  final bool isSelected;
  final VoidCallback onTap;

  const _LanguageItem({
    required this.title,
    required this.languageCode,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? Theme.of(context).primaryColor
                : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor.withOpacity(0.1),
              ),
              child: Center(
                child: Text(
                  languageCode == 'en' ? 'EN' : 'ع',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 15),

            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            Radio<String>(
              value: languageCode,
              groupValue: isSelected ? languageCode : null,
              onChanged: (_) {
                onTap();
              },
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:lenguo_app/core/di/injection.dart';

// // import 'package:lenguo_app/core/di/service%20locator.dart';
// import 'package:lenguo_app/features/language_selection/presentation/cubit/language_selection_cubit.dart';
// import 'package:lenguo_app/features/language_selection/presentation/cubit/language_selection_state.dart';

// class LanguageSelectionScreen extends StatelessWidget {
//   const LanguageSelectionScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     print('LANGUAGE SCREEN OPENED');

//     return Scaffold(
//       appBar: AppBar(title: const Text('Language')),
//       body: Builder(
//         builder: (context) {
//           print('BEFORE GET CUBIT');

//           final cubit = sl<LanguageSelectionCubit>();

//           print('AFTER GET CUBIT: $cubit');

//           return BlocBuilder<LanguageSelectionCubit, LanguageSelectionState>(
//             bloc: cubit,
//             builder: (context, state) {
//               return const Center(
//                 child: Text(
//                   'Language Selection',
//                   style: TextStyle(fontSize: 24),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
