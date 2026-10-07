import 'package:lenguo_app/features/grammar/domain/entity/grammar_structure_entity.dart';

class GrammarStructureModel {
  final String iYouWeThey;
  final String heSheIt;

  const GrammarStructureModel({
    required this.iYouWeThey,
    required this.heSheIt,
  });

  factory GrammarStructureModel.fromJson(Map<String, dynamic> json) {
    return GrammarStructureModel(
      iYouWeThey: json['i_you_we_they'],
      heSheIt: json['he_she_it'],
    );
  }

  GrammarStructureEntity toEntity() {
    return GrammarStructureEntity(iYouWeThey: iYouWeThey, heSheIt: heSheIt);
  }
}
