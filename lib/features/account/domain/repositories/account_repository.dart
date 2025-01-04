import 'package:buenro_hotels/common/helpers/base_usecase.dart';
import 'package:buenro_hotels/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AccountRepository {
  Future<Either<Failure, NoParams>> changeLanguage(String languageCode);
}
