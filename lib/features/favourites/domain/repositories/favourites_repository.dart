import 'package:buenro_hotels/core/errors/failures.dart';
import 'package:buenro_hotels/features/hotels/data/models/search_response.dart';
import 'package:dartz/dartz.dart';

abstract class FavouritesRepository {
  Future<Either<Failure, List<PropertyModel>>> loadFavourites();
  Future<Either<Failure, List<PropertyModel>>> addFavourite(
      PropertyModel model);
  Future<Either<Failure, List<PropertyModel>>> deleteFavourite(
      PropertyModel model);
  Future<Either<Failure, bool>> checkIfFav(PropertyModel model);
}
