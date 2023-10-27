import 'package:anywhere_code_challange/data/models/character_model.dart';
import 'package:anywhere_code_challange/domain/repositories/character_repository.dart';
import 'package:anywhere_code_challange/domain/use_cases/get_characters_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_characters_use_case_test.mocks.dart';

@GenerateMocks([CharacterRepository])
void main() {
  late GetCharactersUseCase getCharactersUseCase;
  late MockCharacterRepository mockCharacterRepository;

  setUp(() {
    mockCharacterRepository = MockCharacterRepository();
    getCharactersUseCase = GetCharactersUseCase(mockCharacterRepository);
  });

  final tCharacters = [
    CharacterModel(
        name: 'Homer Simpson', text: 'Homer Simpson bio', image: 'image_url'),
    // Add more characters if needed
  ];

  test('should get characters from the repository', () async {
    // arrange
    when(mockCharacterRepository.getCharacters())
        .thenAnswer((_) async => tCharacters);
    // act
    final result = await getCharactersUseCase.getCharacters();
    // assert
    expect(result, tCharacters);
    verify(mockCharacterRepository.getCharacters());
    verifyNoMoreInteractions(mockCharacterRepository);
  });
}
