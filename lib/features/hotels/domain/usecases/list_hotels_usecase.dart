import 'package:buenro_hotels/common/helpers/base_usecase.dart';
import 'package:buenro_hotels/core/errors/failures.dart';
import 'package:buenro_hotels/core/storage/storage_preference_manager.dart';
import 'package:buenro_hotels/features/hotels/data/models/query_hotel_model.dart';
import 'package:buenro_hotels/features/hotels/data/models/search_response.dart';
import 'package:buenro_hotels/features/hotels/domain/repositories/hotels_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ListHotelsUsecase implements UseCase<SearchResponse, GetHotelsParams> {
  final HotelsRepository _repo;
  final SharedPreferencesManager _preferencesManager;

  ListHotelsUsecase(this._repo, this._preferencesManager);

  @override
  Future<Either<Failure, SearchResponse>> call(GetHotelsParams params) async {
    return await _repo.listHotels(QueryHotelModel(
      engine: params.engine,
      q: params.q.isEmpty ? 'Bali Hotels' : params.q,
      gl: params.gl,
      hl: _preferencesManager.getString(SharedPreferencesManager.language) ??
          'en',
      currency: params.currency,
      checkInDate: params.checkInDate,
      checkOutDate: params.checkOutDate,
      nextPageToken: params.nextPageToken,
    ));
  }
}
