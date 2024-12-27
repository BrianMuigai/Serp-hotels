import 'package:buenro_hotels/core/errors/failures.dart';
import 'package:buenro_hotels/features/hotels/data/models/query_hotel_model.dart';
import 'package:buenro_hotels/features/hotels/data/models/search_response.dart';
import 'package:dartz/dartz.dart';

abstract class HotelsRepository {
  Future<Either<Failure, SearchResponse>> listHotels(QueryHotelModel query);
}
