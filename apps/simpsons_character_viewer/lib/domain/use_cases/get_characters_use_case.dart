import 'package:simpsons_character_viewer/data/models/character_model.dart';
import 'package:simpsons_character_viewer/domain/repositories/character_repository.dart';

class GetCharactersUseCase {
  final CharacterRepository characterRepository;

  GetCharactersUseCase(this.characterRepository);

  Future<List<CharacterModel>> getCharacters() {
    return characterRepository.getCharacters();
  }
}
