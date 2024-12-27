import 'package:buenro_hotels/common/helpers/base_usecase.dart';
import 'package:buenro_hotels/common/utils/date_utils.dart';
import 'package:buenro_hotels/features/hotels/domain/usecases/list_hotels_usecase.dart';
import 'package:buenro_hotels/features/hotels/presentation/bloc/hotels_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockListHotelsUsecase extends Mock implements ListHotelsUsecase {}

void main() {
  test('HotelsBloc should emit correct states', () {
    final mockUsecase = MockListHotelsUsecase();
    final bloc = HotelsBloc(mockUsecase);
    bloc.add(ListHotelsEvent(
        params: GetHotelsParams(
      checkInDate: formatDateObj(getCurrentDateTime()),
      checkOutDate: formatDateObj(addDays(1, getCurrentDateTime())),
    )));

    expectLater(
      bloc.stream,
      emitsInOrder([
        isA<HotelsLoadingState>(),
        isA<ListHotelsSuccess>(),
      ]),
    );
  });
}
