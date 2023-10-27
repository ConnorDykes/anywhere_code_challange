import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:anywhere_code_challange/presentation/view_models/home_view_model.dart';
import 'package:anywhere_code_challange/domain/use_cases/get_characters_use_case.dart';
import 'package:anywhere_code_challange/data/models/character_model.dart';

import 'home_view_model_test.mocks.dart';

@GenerateMocks([GetCharactersUseCase, CharacterModel])
void main() {
  late HomeViewModel viewModel;
  late MockGetCharactersUseCase mockGetCharactersUseCase;

  setUp(() {
    mockGetCharactersUseCase = MockGetCharactersUseCase();
    viewModel = HomeViewModel(
      apiUrl: 'http://api.duckduckgo.com/?q=the+wire+characters&format=json',
    );
  });

  group('getCharacters', () {
    test('returns a list of CharacterModel', () async {
      when(mockGetCharactersUseCase.getCharacters())
          .thenAnswer((_) async => [MockCharacterModel()]);

      expect(await viewModel.getCharacters(), isA<List<CharacterModel>>());
    });
  });

  group('search', () {
    test(
        'returns a list of CharacterModel that contains the query in either the name or the text',
        () {
      final characters = [
        CharacterModel(name: 'Test1', text: '', image: ''),
        CharacterModel(name: 'Test2', text: 'Test1', image: ''),
        CharacterModel(name: 'Test3', text: '', image: ''),
      ];

      final result = viewModel.search(characters: characters, query: 'Test1');

      expect(result, [
        CharacterModel(name: 'Test1', text: '', image: ''),
        CharacterModel(name: 'Test2', text: 'Test1', image: ''),
      ]);
    });
  });
}
