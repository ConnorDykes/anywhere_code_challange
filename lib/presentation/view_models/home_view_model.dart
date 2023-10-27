import 'package:anywhere_code_challange/data/data_source/remote_data_source.dart';
import 'package:anywhere_code_challange/data/models/character_model.dart';
import 'package:anywhere_code_challange/data/repositories/character_repo_impl.dart';
import 'package:anywhere_code_challange/domain/use_cases/get_characters_use_case.dart';
import 'package:http/http.dart';

class HomeViewModel {
  final String apiUrl;
  HomeViewModel({required this.apiUrl});
  // This methods could me improved by registering singleton instances on of the classes.
  // This can be done using a number of packages such as Provider or Get_It.
  // However, for this example we are only calling these classes in this methods
  // so for the sake of simplicity I did not.

  Future<List<CharacterModel>> getCharacters() async {
    return await GetCharactersUseCase(CharacterRepoImpl(
            charactersRemoteDataSource: CharactersRemoteDataSourceImpl(
                client: Client(), apiUrl: apiUrl)))
        .getCharacters();
  }

  List<CharacterModel> search(
      {required List<CharacterModel> characters, required String query}) {
    var characterNames = characters
        .where((character) =>
            character.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    var characterDescriptions = characters
        .where((character) =>
            character.text.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return [...characterNames, ...characterDescriptions];
  }
}
