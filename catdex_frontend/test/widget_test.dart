import 'package:flutter_test/flutter_test.dart';
import 'package:catdex_frontend/main.dart';

void main() {
  testWidgets('App should render without crashing', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const CatDexApp());

    // Verify that the splash screen shows 'CatDex' title.
    expect(find.text('CatDex'), findsOneWidget);
  });
}
