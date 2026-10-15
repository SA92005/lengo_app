// import 'package:flutter/material.dart';
// import 'package:lenguo_app/core/theme/app_text_style.dart';
// import 'package:lenguo_app/features/grammar/presentation/ui/widgets/grammar_arabic_text.dart';
// import 'package:lenguo_app/features/grammar/presentation/ui/widgets/grammar_info_container.dart';

// class GrammarVerbRuleContainer extends StatelessWidget {
//   const GrammarVerbRuleContainer({super.key, required this.rule});

//   final List<>
//   @override
//   Widget build(BuildContext context) {
//     return GrammarInfoContainer(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           GrammarArabicText(text: rule.rule),

//           const SizedBox(height: 6),

//           Text(rule.form, style: AppTextStyle.loginAndRegisterSubtitle),

//           const SizedBox(height: 8),

//           ...rule.examples.map(
//             (example) => Padding(
//               padding: const EdgeInsets.only(bottom: 4),
//               child: Text(
//                 '• $example',
//                 style: AppTextStyle.loginAndRegisterSubtitle,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
