import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:ecommerce_app/main.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('splash screen opens the login page for a guest', (tester) async {
    SharedPreferences.setMockInitialValues({'checkLogin': false});

    await tester.pumpWidget(const MyApp());

    expect(find.text('FACI'), findsOneWidget);
    expect(find.text('O'), findsOneWidget);

    await tester.pump(const Duration(seconds: 4));
    await tester.pumpAndSettle();

    expect(find.text('Sign In'), findsOneWidget);
  });
}
