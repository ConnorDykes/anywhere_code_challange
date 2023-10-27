import 'package:anywhere_code_challange/data/models/character_model.dart';
import 'package:anywhere_code_challange/domain/repositories/character_repository.dart';

class GetCharactersUseCase {
  final CharacterRepository characterRepository;

  GetCharactersUseCase(this.characterRepository);

  Future<List<CharacterModel>> getCharacters() {
    return characterRepository.getCharacters();
  }
}
