import 'package:simpsons_character_viewer/core/utils/name_converter.dart';

class CharacterModel {
  final String name;
  final String text;
  final String image;

  CharacterModel({required this.name, required this.text, required this.image});

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
        name: convertNameFromUrl(json['FirstURL']),
        text: json['Text'],
        image: json['Icon']['URL']);
  }
}
