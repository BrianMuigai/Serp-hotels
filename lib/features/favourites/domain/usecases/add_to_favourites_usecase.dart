import 'package:buenro_hotels/common/helpers/base_usecase.dart';
import 'package:buenro_hotels/core/errors/failures.dart';
import 'package:buenro_hotels/features/favourites/domain/repositories/favourites_repository.dart';
import 'package:buenro_hotels/features/hotels/data/models/search_response.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddToFavouritesUsecase
    implements UseCase<List<PropertyModel>, PropertyModel> {
  final FavouritesRepository _repo;

  AddToFavouritesUsecase(this._repo);

  @override
  Future<Either<Failure, List<PropertyModel>>> call(
      PropertyModel params) async {
    return await _repo.addFavourite(params);
  }
}
