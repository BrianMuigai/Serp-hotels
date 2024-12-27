import 'package:buenro_hotels/common/utils/date_utils.dart';
import 'package:buenro_hotels/features/hotels/data/datasources/hotels_remote_datasource.dart';
import 'package:buenro_hotels/features/hotels/data/models/query_hotel_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:buenro_hotels/features/hotels/data/repositories/hotels_repository_impl.dart';

class MockHotelsDataSource extends Mock implements HotelsRemoteDatasource {}

void main() {
  test('HotelsRepositoryImpl should return list of hotels', () async {
    final mockDataSource = MockHotelsDataSource();
    final repo = HotelsRepositoryImpl(mockDataSource);

    when(mockDataSource.listHotels(QueryHotelModel(
      engine: 'engine',
      q: 'query',
      gl: 'US',
      hl: 'en',
      currency: 'USD',
      checkInDate: formatDateObj(getCurrentDateTime()),
      checkOutDate: formatDateObj(addDays(1, getCurrentDateTime())),
    ))).thenAnswer((_) async => [Search(name: 'Test Hotel')]);

    final result = await repo.listHotels(QueryHotelModel(
      engine: 'engine',
      q: 'query',
      gl: 'US',
      hl: 'en',
      currency: 'USD',
      checkInDate: formatDateObj(getCurrentDateTime()),
      checkOutDate: formatDateObj(addDays(1, getCurrentDateTime())),
    ));
    expect(result.isRight(), true);
  });
}
