import 'package:anywhere_code_challange/data/data_source/remote_data_source.dart';
import 'package:anywhere_code_challange/data/models/character_model.dart';
import 'package:anywhere_code_challange/domain/repositories/character_repository.dart';
import 'package:flutter/material.dart';

class CharacterRepoImpl extends CharacterRepository {
  final CharactersRemoteDataSource charactersRemoteDataSource;
  CharacterRepoImpl({required this.charactersRemoteDataSource});

  @override
  Future<List<CharacterModel>> getCharacters() async {
    try {
      return await charactersRemoteDataSource.getCharacters();
    } on Exception catch (e) {
      debugPrint(e.toString());
      // I return a list of one Character Model that has an error message in it
      // This was I can see in the UI that there was an issue.
      return [CharacterModel(name: "", text: "Error: {$e}", image: '')];
    }
  }
}
