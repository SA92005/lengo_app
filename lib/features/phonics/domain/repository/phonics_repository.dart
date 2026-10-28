

import 'package:lenguo_app/features/phonics/domain/entities/phonics_entity.dart';

abstract class PhonicsRepository {

  Future<PhonicsEntity> getPhonicByName(String name);
}
