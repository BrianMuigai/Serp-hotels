import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:buenro_hotels/features/hotels/presentation/pages/hotels_screen.dart';

void main() {
  testWidgets('HotelsScreen should render correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: HotelsScreen()));

    expect(find.byType(ListView), findsOneWidget);
  });
}
