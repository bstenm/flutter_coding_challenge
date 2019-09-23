import '../lib/widgets/DictionaryEntryHeader.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Displays the dictionary entry  ', (WidgetTester tester) async {
    await tester.pumpWidget(DictionaryEntryHeader(entry: 'A'));

    final headerFinder = find.text('A');

    expect(headerFinder, findsOneWidget);
  });
}
