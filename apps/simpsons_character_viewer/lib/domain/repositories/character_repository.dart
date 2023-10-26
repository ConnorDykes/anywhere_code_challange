import 'package:simpsons_character_viewer/data/models/character_model.dart';

abstract class CharacterRepository {
  Future<List<CharacterModel>> getCharacters();
}
