import 'package:anywhere_code_challange/core/utils/name_converter.dart';
import 'package:anywhere_code_challange/data/models/character_model.dart';
import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {
  final CharacterModel character;
  const DetailView({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    String name = convertNameFromUrl(character.name);
    String description = removeNameFromText(character.text, name);

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Image.network(
              "https://duckduckgo.com" + character.image,
              height: 200,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return LinearProgressIndicator(
                  value: loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!,
                );
              },
              errorBuilder: (context, error, stackTrace) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Icon(
                      Icons.photo_size_select_actual_rounded,
                      color: Colors.red,
                    ),
                    Text(
                      'Photo Not Available',
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                ),
              ),
            ),
            Text(description),
          ],
        ),
      ),
    );
  }
}
