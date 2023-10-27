import 'dart:convert';

import 'package:anywhere_code_challange/data/models/character_model.dart';

import 'package:http/http.dart' as http;

abstract class CharactersRemoteDataSource {
  Future<List<CharacterModel>> getCharacters();
}

class CharactersRemoteDataSourceImpl extends CharactersRemoteDataSource {
  final http.Client client;
  final String apiUrl;
  CharactersRemoteDataSourceImpl({required this.client, required this.apiUrl});

  @override
  Future<List<CharacterModel>> getCharacters() async {
    final response = await client.get(Uri.parse(apiUrl));

    //The only relevant field fro the api is the "RelatedTopics", we deduce the model date from that
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      List<CharacterModel> characters = (jsonResponse['RelatedTopics']
              as List<dynamic>)
          .map<CharacterModel>(
              (item) => CharacterModel.fromJson(item as Map<String, dynamic>))
          .toList();

      // The api is returning "Apu" twice for some reason so I removed it
      if (characters.first.name == "Apu Nahasapeemapetilan") {
        characters.removeAt(0);
      }

      return characters;
    } else {
      throw Exception('Failed to load characters');
    }
  }
}
