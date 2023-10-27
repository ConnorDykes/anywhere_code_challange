import 'package:flutter_test/flutter_test.dart';
import 'package:simpsons_character_viewer/data/models/character_model.dart';

void main() {
  group('CharacterModel', () {
    final json = {
      'FirstURL': 'https://duckduckgo.com/Homer_Simpson',
      'Text': 'Homer Simpson - Character from The Simpsons',
      'Icon': {'URL': 'i/homer.png'}
    };

    test('fromJson creates a CharacterModel from JSON', () {
      final character = CharacterModel.fromJson(json);

      expect(character.name, 'Homer Simpson');
      expect(character.text, 'Homer Simpson - Character from The Simpsons');
      expect(character.image, 'i/homer.png');
    });

    test('props includes all properties', () {
      final character = CharacterModel.fromJson(json);

      expect(
          character.props, [character.name, character.text, character.image]);
    });
  });
}
