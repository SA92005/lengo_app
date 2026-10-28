import 'package:lenguo_app/features/phonics/domain/entities/phonics_content_entity.dart';
import 'package:lenguo_app/features/phonics/domain/entities/phonics_practice_entity.dart';

class PhonicsEntity {
  final String id;
  final String letter;
  final String title;
  final String titleAr;
  final String category;
  final PhonicsContentEntity content;
  final List<PhonicsPracticeEntity> practice;

  PhonicsEntity({
    required this.id,
    required this.letter,
    required this.title,
    required this.titleAr,
    required this.category,
    required this.content,
    required this.practice,
  });
}
