import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lenguo_app/core/errors/failures.dart';
import 'package:lenguo_app/features/grammar/domain/usecase/get_garammar_usecase.dart';
import 'package:lenguo_app/features/grammar/presentation/cubit/grammar_states.dart';

@injectable
class GrammarCubit extends Cubit<GrammarState> {
  final GetGarammarUsecase getGarammarUsecase;
  GrammarCubit({required this.getGarammarUsecase}) : super(GrammarInitial());

  // Future<void> getGrammar(String name) async {
  //   emit(GrammarLoading());
  //   try {
  //     final grammar = await getGarammarUsecase.call(name);
  //     emit(GrammarSuccess(grammar));
  //   } on CacheFailure catch (e) {
  //     emit(GrammarError(e.message));
  //   } catch (e) {
  //     emit(GrammarError('Something went wrong. Please try again later.'));
  //   }
  // }
Future<void> getGrammar(String name) async {
  debugPrint('Grammar: started loading $name');

  emit(GrammarLoading());

  try {
    final grammar = await getGarammarUsecase.call(name);

    debugPrint('Grammar: loaded successfully');

    emit(GrammarSuccess(grammar));
  } on CacheFailure catch (e) {
    debugPrint('Grammar: CacheFailure: ${e.message}');
    emit(GrammarError(e.message));
  } catch (e, stackTrace) {
    debugPrint('Grammar: unexpected error: $e');
    debugPrintStack(stackTrace: stackTrace);

    emit(
      GrammarError('Something went wrong. Please try again later.'),
    );
  }
}
}
