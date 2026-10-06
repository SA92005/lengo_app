import 'package:lenguo_app/features/vocablaries/domain/entity/vocablaries_entity.dart';

abstract class VocabulariesState {}

class VocabulariesInitial extends VocabulariesState {}

class VocabulariesLoading extends VocabulariesState {}

class VocabulariesSuccess extends VocabulariesState {
  final List<VocablariesEntity> vocabularies;

  VocabulariesSuccess(this.vocabularies);
}

class VocabulariesFailure extends VocabulariesState {
  final String message;

  VocabulariesFailure(this.message);
}
