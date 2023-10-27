import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:simpsons_character_viewer/data/data_source/remote_data_source.dart';
import 'package:simpsons_character_viewer/data/models/character_model.dart';
import 'package:simpsons_character_viewer/data/repositories/character_repo_impl.dart';

import 'character_repo_impl_test.mocks.dart';

@GenerateMocks([CharactersRemoteDataSource])
void main() {
  late MockCharactersRemoteDataSource mockDataSource;
  late CharacterRepoImpl characterRepo;

  setUp(() {
    mockDataSource = MockCharactersRemoteDataSource();
    characterRepo =
        CharacterRepoImpl(charactersRemoteDataSource: mockDataSource);
  });

  group('getCharacters', () {
    final tCharacters = [
      CharacterModel(
          name: 'Homer Simpson',
          text: 'Character from The Simpsons',
          image: 'http://example.com/homer.png'),
      // Add more characters if needed
    ];

    test('returns a List<CharacterModel> when the dataSource does not throw',
        () async {
      // Arrange
      when(mockDataSource.getCharacters()).thenAnswer((_) async => tCharacters);
      // Act
      final result = await characterRepo.getCharacters();
      // Assert
      expect(result, equals(tCharacters));
    });

    test(
        'returns a List<CharacterModel> with an error character when the dataSource throws',
        () async {
      // Arrange
      when(mockDataSource.getCharacters())
          .thenThrow(Exception('Failed to load characters'));
      // Act
      final result = await characterRepo.getCharacters();
      // Assert
      expect(result[0].text, startsWith('Error:'));
    });
  });
}
