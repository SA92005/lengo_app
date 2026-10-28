import 'package:injectable/injectable.dart';
import 'package:lenguo_app/features/phonics/domain/entities/phonics_entity.dart';
import 'package:lenguo_app/features/phonics/domain/repository/phonics_repository.dart';
@injectable
class PhonicsUsecase {
 final PhonicsRepository repository;
 PhonicsUsecase(this.repository);
 Future<PhonicsEntity> call(String fileName) {
    return repository.getPhonicByName(fileName);
  }



}