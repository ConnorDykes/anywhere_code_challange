import 'package:anywhere_code_challange/core/utils/name_converter.dart';
import 'package:equatable/equatable.dart';

class CharacterModel extends Equatable {
  final String name;
  final String text;
  final String image;

  CharacterModel({
    required this.name,
    required this.text,
    required this.image,
  });

  factory CharacterModel.fromJson(dynamic json) {
    return CharacterModel(
        name: convertNameFromUrl(json['FirstURL']),
        text: json['Text'],
        image: json['Icon']['URL']);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [name, text, image];
}
