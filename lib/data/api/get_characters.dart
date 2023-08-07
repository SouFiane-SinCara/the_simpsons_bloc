import 'dart:convert';

import 'package:breaking_bad_app_bloc/constants/strings.dart';
import 'package:breaking_bad_app_bloc/data/models/Character.dart';
import 'package:http/http.dart';

class GetCharacters {
  Future<List<CharacterModel>> getcharacters() async {
    final jsondata =
        await get(Uri.parse("https://rickandmortyapi.com/api/character"));
    List characters = json.decode(jsondata.body)['results'].toList();
    List<CharacterModel> listcharaters = characters.map((e) {
      return CharacterModel.fromJson(e);
    }).toList();
    return listcharaters;
  }
}
