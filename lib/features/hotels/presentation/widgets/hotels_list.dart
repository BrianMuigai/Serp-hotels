import 'package:buenro_hotels/common/helpers/base_usecase.dart';
import 'package:buenro_hotels/common/res/strings.dart';
import 'package:buenro_hotels/common/utils/date_utils.dart';
import 'package:buenro_hotels/features/hotels/data/models/search_response.dart';
import 'package:buenro_hotels/features/hotels/presentation/bloc/hotels_bloc.dart';
import 'package:buenro_hotels/features/hotels/presentation/widgets/hotels_shimmer.dart';
import 'package:buenro_hotels/features/hotels/presentation/widgets/property_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelsList extends StatelessWidget {
  const HotelsList({super.key});

  @override
  Widget build(BuildContext context) {
    final hotelsBloc = context.read<HotelsBloc>();
    return BlocBuilder<HotelsBloc, HotelsState>(builder: (context, state) {
      if (state is HotelsLoadingState) {
        return HotelsShimmer();
      } else if (state is ListHotelsError) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                state.error,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red),
              ),
            ),
            IconButton(
                onPressed: () => hotelsBloc.add(ListHotelsEvent(
                      params: GetHotelsParams(
                          checkInDate: formatDateObj(getCurrentDateTime()),
                          checkOutDate:
                              formatDateObj(addDays(1, getCurrentDateTime()))),
                    )),
                icon: Icon(Icons.replay_outlined))
          ],
        );
      } else if (state is ListHotelsSuccess || hotelsBloc.hotels != null) {
        SearchResponse hotels;
        if (state is ListHotelsSuccess) {
          hotels = state.hotels;
        } else {
          hotels = hotelsBloc.hotels!;
        }
        if (hotels.properties.isEmpty) {
          return Center(child: Text(AppStrings.noData));
        }
        return ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount: hotels.properties.length,
          itemBuilder: (context, index) =>
              PropertyCard(hotel: hotels.properties[index]),
        );
      }
      return Center(child: Text(AppStrings.noData));
    });
  }
}
