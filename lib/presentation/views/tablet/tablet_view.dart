import 'package:anywhere_code_challange/core/utils/name_converter.dart';
import 'package:anywhere_code_challange/data/models/character_model.dart';
import 'package:anywhere_code_challange/presentation/view_models/home_view_model.dart';
import 'package:anywhere_code_challange/presentation/views/detail_view.dart';
import 'package:flutter/material.dart';

class TabletView extends StatefulWidget {
  final String apiUrl;
  final String title;
  const TabletView({super.key, required this.apiUrl, required this.title});

  @override
  State<TabletView> createState() => _TabletViewState();
}

class _TabletViewState extends State<TabletView> {
  late final HomeViewModel viewModel;
  TextEditingController searchController = TextEditingController();
  Future<List<CharacterModel>>? charactersFuture;
  CharacterModel? selectedCharacter;

  @override
  void initState() {
    super.initState();
    viewModel = HomeViewModel(apiUrl: widget.apiUrl);
    charactersFuture = viewModel.getCharacters();
  }

  selectCharacter(CharacterModel character) {
    setState(() {
      selectedCharacter = character;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Row(
        children: [
          Flexible(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: searchController,
                    onChanged: (value) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      labelText: "Search",
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      ),
                    ),
                  ),
                ),
                FutureBuilder(
                  future: charactersFuture,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                      // Shimmer.fromColors(child: ListTile(), baseColor: Colors.grey, highlightColor: Colors.grey[200])
                    } else {
                      // listen to textfeild and adjust character list based on search
                      List<CharacterModel> characters =
                          searchController.text.isEmpty
                              ? snapshot.data
                              : viewModel.search(
                                  characters: snapshot.data,
                                  query: searchController.text);

                      return Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: characters.length,
                          itemBuilder: (BuildContext context, int index) {
                            CharacterModel character = characters[index];

                            return ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Image.network(
                                    "https://duckduckgo.com" + character.image,
                                    height: 200,
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return LinearProgressIndicator(
                                        value: loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!,
                                      );
                                    },
                                    errorBuilder:
                                        (context, error, stackTrace) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(Icons.person,
                                          color: Colors.grey),
                                    ),
                                  ),
                                ),
                                title: Text(convertNameFromUrl(character.name)),
                                trailing:
                                    Icon(Icons.keyboard_arrow_right_rounded),
                                onTap: () => selectCharacter(character));
                          },
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          Flexible(
              child: selectedCharacter != null
                  ? DetailView(character: selectedCharacter!)
                  : Center(
                      child: Text("Select a Character"),
                    ))
        ],
      ),
    );
  }
}
