import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:lenguo_app/core/errors/exceptions.dart';
import 'package:lenguo_app/features/vocablaries/data/datasource/vocablaries_datasource.dart';
import 'package:lenguo_app/features/vocablaries/data/model/vocablaries_model.dart';

@Injectable(as: VocabulariesDataSource)
@lazySingleton
class VocabulariesDatasourceImpl implements VocabulariesDataSource {
  @override
  Future<List<VocablariesModel>> getVocabulary(String category) async {
    try {
      final jsonString = await rootBundle.loadString(
        'assets/vocablory/$category.json',
      );
      final List<dynamic> jsonData = List<Map<String, dynamic>>.from(
        jsonDecode(jsonString),
      );
      return jsonData.map((json) => VocablariesModel.fromJson(json)).toList();
    } catch (e) {
      throw CacheException(message: 'Failed to load vocabulary data');
    }
  }
}
