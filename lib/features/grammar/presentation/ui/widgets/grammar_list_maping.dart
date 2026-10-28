import 'package:flutter/material.dart';
import 'package:lenguo_app/features/grammar/presentation/ui/widgets/grammar_arabic_text.dart';

class GrammarListMaping extends StatelessWidget {
  const GrammarListMaping({
    super.key,
    required this.items,
    this.bullet = false,
    this.textDirection = TextDirection.ltr,
    this.alignment = AlignmentGeometry.center,
  });

  final List<String> items;
  final bool bullet;
  final TextDirection? textDirection;

  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items
          .map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: GrammarArabicText(
                text: item,
                bullet: bullet,
                textDirection: textDirection,
                alignment: alignment,
              ),
            ),
          )
          .toList(),
    );
  }
}
