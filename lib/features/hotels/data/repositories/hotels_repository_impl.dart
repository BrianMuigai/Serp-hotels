import 'package:buenro_hotels/core/api_client/models/server_error.dart';
import 'package:buenro_hotels/core/errors/exceptions.dart';
import 'package:buenro_hotels/core/errors/failures.dart';
import 'package:buenro_hotels/features/hotels/data/datasources/hotels_remote_datasource.dart';
import 'package:buenro_hotels/features/hotels/data/models/query_hotel_model.dart';
import 'package:buenro_hotels/features/hotels/data/models/search_response.dart';
import 'package:buenro_hotels/features/hotels/domain/repositories/hotels_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HotelsRepository)
class HotelsRepositoryImpl implements HotelsRepository {
  final HotelsRemoteDatasource _remoteDatasource;

  HotelsRepositoryImpl(this._remoteDatasource);

  @override
  Future<Either<Failure, SearchResponse>> listHotels(
      QueryHotelModel query) async {
    try {
      final result = await _remoteDatasource.listHotels(query);
      if (result is ServerError) {
        return Left(ServerFailure(badResponse: result));
      }
      return Right(SearchResponse.fromJson(result));
    } on ServerException {
      return const Left(ServerFailure());
    }
  }
}
