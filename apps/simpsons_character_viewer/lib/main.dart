import 'package:anywhere_code_challange/presentation/views/character_list_view.dart';
import 'package:anywhere_code_challange/presentation/views/tablet/tablet_view.dart';
import 'package:flutter/material.dart';
import 'package:simpsons_character_viewer/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final apiUrl = apiURl;
    double screenWidth = MediaQuery.of(context).size.width;
    final String title = 'Simpsons Character Viewer';
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: screenWidth > 500
          ? TabletView(
              title: title,
              apiUrl: apiUrl,
            )
          : CharacterListView(
              title: title,
              apiUrl: apiUrl,
            ),
    );
  }
}
