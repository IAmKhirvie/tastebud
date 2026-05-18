import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:tastebud/main.dart';

void main() {
  testWidgets('TasteBud renders home screen', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: TasteBudApp()));
    expect(find.text('TasteBud'), findsOneWidget);
  });
}
