import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> printRmCharacters() async {
  try {
    String url = 'https://rickandmortyapi.com/api/character';

    while (url.isNotEmpty) {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List characters = data['results'];

        for (var character in characters) {
          print(character['name']);
        }

        // Move to next page
        url = data['info']['next'] ?? '';
      } else {
        throw 'Failed to load characters. Status code: ${response.statusCode}';
      }
    }
  } catch (e) {
    print('error caught: $e');
  }
}
