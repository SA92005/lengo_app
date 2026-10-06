import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lenguo_app/core/errors/failures.dart';
import 'package:lenguo_app/features/vocablaries/domain/usecase/vocablaries_get_usecase.dart';
import 'package:lenguo_app/features/vocablaries/presentation/cubit/vocablaries_states.dart';

@injectable
class VocabulariesCubit extends Cubit<VocabulariesState> {
  final VocabulariesGetUseCase vocabulariesUseCase;
  VocabulariesCubit(this.vocabulariesUseCase) : super(VocabulariesInitial());
  Future<void> getVocabsByCategory(String category) async {
    emit(VocabulariesLoading());
    try {
      final vocabularies = await vocabulariesUseCase(category);
      emit(VocabulariesSuccess(vocabularies));
    } on CacheFailure catch (e) {
      emit(VocabulariesFailure(e.toString()));
    } catch (e) {
      emit(VocabulariesFailure('Something went wrong.'));
    }
  }
}
