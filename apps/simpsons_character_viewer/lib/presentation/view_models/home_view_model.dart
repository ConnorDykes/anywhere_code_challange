import 'package:http/http.dart';
import 'package:simpsons_character_viewer/data/data_source/remote_data_source.dart';
import 'package:simpsons_character_viewer/data/models/character_model.dart';
import 'package:simpsons_character_viewer/data/repositories/character_repo_impl.dart';
import 'package:simpsons_character_viewer/domain/use_cases/get_characters_use_case.dart';

class HomeViewModel {
  // This methods could me improved by registering singleton instances on of the classes.
  // This can be done using a number of packages such as Provider or Get_It.
  // However, for this example we are only calling these classes in this methods
  // so for the sake of simplicity I did not.

  Future<List<CharacterModel>> getCharacters() async {
    return await GetCharactersUseCase(CharacterRepoImpl(
            charactersRemoteDataSource:
                CharactersRemoteDataSourceImpl(client: Client())))
        .getCharacters();
  }

  List<CharacterModel> search(
      {required List<CharacterModel> characters, required String query}) {
    return characters
        .where((character) =>
            character.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
