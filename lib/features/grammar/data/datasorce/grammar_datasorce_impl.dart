import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:lenguo_app/core/errors/exceptions.dart';
import 'package:lenguo_app/features/grammar/data/datasorce/grammar_datasorce.dart';
import 'package:lenguo_app/features/grammar/data/model/grammar_model.dart';

@Injectable(as: GrammarDataSource)
@lazySingleton
class GrammarDataSourceImpl implements GrammarDataSource {
  @override
  Future<GrammarModel> getGrammar(String name) async {
    try {
      final jsonString = await rootBundle.loadString(
        'assets/grammar/$name.json',
      );

      final jsonData = jsonDecode(jsonString);

      return GrammarModel.fromJson(jsonData);
    } catch (e) {
      throw CacheException(message: 'Failed to load grammar data.');
    }
  }
}
