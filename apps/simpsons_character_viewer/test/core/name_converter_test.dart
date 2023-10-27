import 'package:flutter_test/flutter_test.dart';
import 'package:simpsons_character_viewer/core/utils/name_converter.dart';

void main() {
  group('Name Converter', () {
    test('Can retrieve name from url', () {
      const url = 'https://duckduckgo.com/Homer_Simpson';
      const expectedName = 'Homer Simpson';
      final actualName = convertNameFromUrl(url);
      expect(actualName, expectedName);
    });

    test('Can me move the name from the beginning text of the text', () {
      const text = 'Homer Simpson - A character from The Simpsons';
      const name = 'Homer Simpson';
      const expectedText = 'A character from The Simpsons';
      final actualText = removeNameFromText(text, name);
      expect(actualText, expectedText);
    });
  });
}
