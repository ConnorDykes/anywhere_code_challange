import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:simpsons_character_viewer/core/utils/name_converter.dart';
import 'package:simpsons_character_viewer/data/models/character_model.dart';
import 'package:simpsons_character_viewer/presentation/view_models/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final viewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simpsons Character Viewer')),
      body: FutureBuilder(
        future: viewModel.getCharacters(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
            // Shimmer.fromColors(child: ListTile(), baseColor: Colors.grey, highlightColor: Colors.grey[200])
          } else {
            List<CharacterModel> characters = snapshot.data;

            return ListView.builder(
              itemCount: characters.length,
              itemBuilder: (BuildContext context, int index) {
                CharacterModel character = characters[index];
                return ListTile(
                  title: Text(convertNameFromUrl(character.url)),
                );
              },
            );
          }
        },
      ),
    );
  }
}
