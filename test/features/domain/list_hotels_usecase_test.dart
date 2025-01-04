import 'package:buenro_hotels/common/helpers/base_usecase.dart';
import 'package:buenro_hotels/common/utils/date_utils.dart';
import 'package:buenro_hotels/core/errors/failures.dart';
import 'package:buenro_hotels/core/storage/storage_preference_manager.dart';
import 'package:buenro_hotels/features/hotels/data/models/query_hotel_model.dart';
import 'package:buenro_hotels/features/hotels/data/models/search_response.dart';
import 'package:buenro_hotels/features/hotels/domain/repositories/hotels_repository.dart';
import 'package:buenro_hotels/features/hotels/domain/usecases/list_hotels_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'list_hotels_usecase_test.mocks.dart';

@GenerateMocks([HotelsRepository, SharedPreferencesManager])
void main() {
  late MockHotelsRepository mockHotelsRepository;
  late MockSharedPreferencesManager mockSharedPreferencesManager;
  late ListHotelsUsecase listHotelsUsecase;

  setUp(() {
    mockHotelsRepository = MockHotelsRepository();
    mockSharedPreferencesManager = MockSharedPreferencesManager();
    listHotelsUsecase =
        ListHotelsUsecase(mockHotelsRepository, mockSharedPreferencesManager);
  });

  test('should return a list of hotels when the repository call is successful',
      () async {
    // Arrange
    final params = GetHotelsParams(
      engine: 'google',
      q: 'New York',
      gl: 'US',
      hl: 'en',
      currency: 'USD',
      checkInDate: formatDateObj(getCurrentDateTime()),
      checkOutDate: formatDateObj(addDays(1, getCurrentDateTime())),
    );

    final queryModel = QueryHotelModel(
      engine: 'google',
      q: 'New York',
      gl: 'US',
      hl: 'en',
      currency: 'USD',
      checkInDate: formatDateObj(getCurrentDateTime()),
      checkOutDate: formatDateObj(addDays(1, getCurrentDateTime())),
    );

    final response = SearchResponse(
        properties: [],
        pagination: SerpApiPagination(
            currentFrom: 1, currentTo: 10, nextPageToken: 'TE'));

    when(mockHotelsRepository.listHotels(queryModel))
        .thenAnswer((_) async => Right(response));

    // Act
    final result = await listHotelsUsecase(params);

    // Assert
    expect(result, Right(response));
    verify(mockHotelsRepository.listHotels(queryModel)).called(1);
    verifyNoMoreInteractions(mockHotelsRepository);
  });

  test('should return a Failure when the repository call fails', () async {
    // Arrange
    final params = GetHotelsParams(
      engine: 'google',
      q: 'New York',
      gl: 'US',
      hl: 'en',
      currency: 'USD',
      checkInDate: formatDateObj(getCurrentDateTime()),
      checkOutDate: formatDateObj(addDays(1, getCurrentDateTime())),
    );

    final queryModel = QueryHotelModel(
      engine: 'google',
      q: 'New York',
      gl: 'US',
      hl: 'en',
      currency: 'USD',
      checkInDate: formatDateObj(getCurrentDateTime()),
      checkOutDate: formatDateObj(addDays(1, getCurrentDateTime())),
    );

    final failure = ServerFailure();

    when(mockHotelsRepository.listHotels(queryModel))
        .thenAnswer((_) async => Left(failure));

    // Act
    final result = await listHotelsUsecase(params);

    // Assert
    expect(result, Left(failure));
    verify(mockHotelsRepository.listHotels(queryModel)).called(1);
    verifyNoMoreInteractions(mockHotelsRepository);
  });
}
