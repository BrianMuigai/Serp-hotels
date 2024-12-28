// hotels.dart
import 'package:buenro_hotels/common/helpers/base_usecase.dart';
import 'package:buenro_hotels/common/res/strings.dart';
import 'package:buenro_hotels/common/utils/date_utils.dart';
import 'package:buenro_hotels/features/hotels/presentation/bloc/hotels_bloc.dart';
import 'package:buenro_hotels/features/hotels/presentation/widgets/hotels_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelsScreen extends StatefulWidget {
  const HotelsScreen({super.key});

  @override
  State<HotelsScreen> createState() => _HotelsScreenState();
}

class _HotelsScreenState extends State<HotelsScreen> {
  @override
  void initState() {
    super.initState();
    final hotelsBloc = context.read<HotelsBloc>();
    if (hotelsBloc.hotels == null) {
      hotelsBloc.add(ListHotelsEvent(
        params: GetHotelsParams(
            checkInDate: formatDateObj((getCurrentDateTime())),
            checkOutDate: formatDateObj(addDays(1, getCurrentDateTime()))),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Top Title Section
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
            child: Text(
              AppStrings.hotelsHeader,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),

          // Search Bar
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.grey[200],
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.black),
                        SizedBox(width: 10),
                        Text(
                          AppStrings.anywhere,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        Spacer(),
                        Text(
                          AppStrings.anytime,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.filter_alt_outlined),
                  onPressed: () {},
                  color: Colors.black,
                ),
              ],
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: HotelsList(),
            ),
          ),
        ],
      ),
    );
  }
}
