// hotels.dart
import 'package:auto_route/auto_route.dart';
import 'package:buenro_hotels/common/helpers/base_usecase.dart';
import 'package:buenro_hotels/common/res/l10n.dart';
import 'package:buenro_hotels/common/utils/date_utils.dart';
import 'package:buenro_hotels/common/utils/debouncer.dart';
import 'package:buenro_hotels/features/hotels/presentation/bloc/hotels_bloc.dart';
import 'package:buenro_hotels/features/hotels/presentation/widgets/hotels_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HotelsScreen extends StatefulWidget {
  const HotelsScreen({super.key});

  @override
  State<HotelsScreen> createState() => _HotelsScreenState();
}

class _HotelsScreenState extends State<HotelsScreen> {
  late HotelsBloc hotelsBloc;
  late ScrollController _scrollController;
  final Debouncer debouncer = Debouncer(milliseconds: 50);
  GetHotelsParams queryParams = GetHotelsParams(
      checkInDate: formatDateObj((getCurrentDateTime())),
      checkOutDate: formatDateObj(addDays(1, getCurrentDateTime())));

  @override
  void initState() {
    super.initState();
    hotelsBloc = context.read<HotelsBloc>();
    if (hotelsBloc.hotels.isEmpty) {
      hotelsBloc.add(ListHotelsEvent(params: queryParams));
    }
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 100) {
      hotelsBloc.add(LoadMoreHotelsEvent(params: queryParams));
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
              AppLocalizations.getString(context, 'hotelsHeader'),
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
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search,
                            color: Colors.black), // Search icon
                        hintText:
                            '${AppLocalizations.getString(context, 'anywhere')} | ${AppLocalizations.getString(context, 'anytime')}', // Placeholder combining both strings
                        hintStyle: TextStyle(color: Colors.black, fontSize: 16),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey[200], // Background color
                      ),
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      // initialValue: queryParams.q,
                      onChanged: (value) {
                        queryParams = queryParams.copyWith(q: value);
                        debouncer.run(
                            timeout: 1000,
                            () => hotelsBloc
                                .add(ListHotelsEvent(params: queryParams)));
                      },
                    ),
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.filter_alt_outlined),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog.adaptive(
                              title: Text(AppLocalizations.getString(
                                  context, 'appName')),
                              content: Text(AppLocalizations.getString(
                                  context, 'notYetImplemented')),
                            ));
                  },
                  color: Colors.black,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          BlocBuilder<HotelsBloc, HotelsState>(builder: (context, state) {
            if (state is LoadingMore || state is HotelsLoadingState) {
              return LinearProgressIndicator(color: Colors.grey[200]);
            }
            return const SizedBox.shrink();
          }),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: HotelsList(controller: _scrollController),
            ),
          ),
        ],
      ),
    );
  }
}
