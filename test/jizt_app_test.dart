import 'package:flutter_test/flutter_test.dart';
import 'package:jizt/home/home.dart';
import 'package:jizt/jizt_app.dart';
import 'package:jizt_repository/jizt_repository.dart';

void main() {
  group('JiztApp', () {
    test(
        'Given null jiztRepository When JiztApp is instantiated Then AssertionError is thrown',
        () {
      expect(() => JiztApp(jiztRepository: null), throwsAssertionError);
    });

    testWidgets(
        'Given non-null jiztRepository When JiztApp is instantiated Then HomePage is rendered',
        (tester) async {
      await tester.pumpWidget(
        JiztApp(jiztRepository: JiztMockRepositoryImpl()),
      );
      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
