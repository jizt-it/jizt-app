import 'package:flutter_test/flutter_test.dart';
import 'package:jizt/app/jizt_app.dart';
import 'package:jizt/home/home.dart';
import 'package:jizt_repository/jizt_repository.dart';

void main() {
  group('JiztApp', () {
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
