class CharacterModel {
  final String url;
  final String text;

  CharacterModel({required this.url, required this.text});

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      url: json['FirstURL'],
      text: json['Text'],
    );
  }
}
