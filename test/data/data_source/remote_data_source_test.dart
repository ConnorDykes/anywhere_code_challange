import 'package:anywhere_code_challange/data/data_source/remote_data_source.dart';
import 'package:anywhere_code_challange/data/models/character_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import 'remote_data_source_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late MockClient mockHttpClient;
  late CharactersRemoteDataSourceImpl dataSource;

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = CharactersRemoteDataSourceImpl(
        client: mockHttpClient,
        apiUrl: 'http://api.duckduckgo.com/?q=simpsons+characters&format=json');
  });

  group('getCharacters', () {
    List<CharacterModel> tCharacters = [
      CharacterModel(
          name: 'Homer Simpson',
          text: 'Homer Simpson - Character from The Simpsons',
          image: 'i/homer.png'),
    ];

    test('returns a List<CharacterModel> when the response code is 200',
        () async {
      // Arrange

      when(mockHttpClient.get(Uri.parse(
              'http://api.duckduckgo.com/?q=simpsons+characters&format=json')))
          .thenAnswer((_) async => http.Response(
              '{"RelatedTopics" : [{"FirstURL": "https://duckduckgo.com/Homer_Simpson","Text": "Homer Simpson - Character from The Simpsons","Icon": {"URL": "i/homer.png"}}]}',
              200));
      // Act
      final result = await dataSource.getCharacters();
      print(result);
      // Assert
      expect(result, equals(tCharacters));
    });

    test('throws an Exception when the response code is not 200', () {
      // Arrange
      when(mockHttpClient.get(Uri.parse(
              'http://api.duckduckgo.com/?q=simpsons+characters&format=json')))
          .thenAnswer((_) async => http.Response('Something went wrong', 404));
      // Act
      final call = dataSource.getCharacters;
      // Assert
      expect(() => call(), throwsException);
    });
  });
}
