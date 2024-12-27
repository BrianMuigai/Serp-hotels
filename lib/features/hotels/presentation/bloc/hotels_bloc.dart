import 'dart:async';

import 'package:buenro_hotels/common/helpers/base_usecase.dart';
import 'package:buenro_hotels/features/hotels/data/models/search_response.dart';
import 'package:buenro_hotels/features/hotels/domain/usecases/list_hotels_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'hotels_event.dart';
part 'hotels_state.dart';

@injectable
class HotelsBloc extends Bloc<HotelsEvent, HotelsState> {
  final ListHotelsUsecase _listHotelsUsecase;
  SearchResponse? hotels;

  HotelsBloc(this._listHotelsUsecase) : super(HotelsInitial()) {
    on<ListHotelsEvent>(_listHotels);
  }

  FutureOr<void> _listHotels(
      ListHotelsEvent event, Emitter<HotelsState> emit) async {
    emit(HotelsLoadingState());
    final response = await _listHotelsUsecase.call(event.params);
    emit(response.fold(
      (error) => ListHotelsError(error: error.toString()),
      (hotels) {
        this.hotels = hotels;
        return ListHotelsSuccess(hotels: hotels);
      },
    ));
  }
}
