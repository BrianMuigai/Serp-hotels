import 'package:buenro_hotels/common/helpers/base_usecase.dart';
import 'package:buenro_hotels/common/utils/date_utils.dart';
import 'package:buenro_hotels/core/errors/failures.dart';
import 'package:buenro_hotels/features/hotels/data/models/hotel.dart';
import 'package:buenro_hotels/features/hotels/data/models/query_hotel_model.dart';
import 'package:buenro_hotels/features/hotels/domain/repositories/hotels_repository.dart';
import 'package:buenro_hotels/features/hotels/domain/usecases/list_hotels_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// Mock class for HotelsRepository
class MockHotelsRepository extends Mock implements HotelsRepository {}

void main() {
  late MockHotelsRepository mockHotelsRepository;
  late ListHotelsUsecase listHotelsUsecase;

  setUp(() {
    mockHotelsRepository = MockHotelsRepository();
    listHotelsUsecase = ListHotelsUsecase(mockHotelsRepository);
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

    final hotelList = [
      Hotel(name: 'Hotel A'),
      Hotel(name: 'Hotel B'),
    ];

    when(mockHotelsRepository.listHotels(queryModel))
        .thenAnswer((_) async => Right(hotelList));

    // Act
    final result = await listHotelsUsecase(params);

    // Assert
    expect(result, Right(hotelList));
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
