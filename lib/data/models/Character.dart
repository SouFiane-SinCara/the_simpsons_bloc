// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class CharacterModel {
  late int id;
  late String name;
  late String status;
  late String species;
  late String gender;
  late String image;
  late List episode;
  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
    required this.episode,
  });
  factory CharacterModel.fromJson(Map jsondata) {
    return CharacterModel(
        id: jsondata['id'],
        name: jsondata['name'],
        status: jsondata['status'],
        species: jsondata['species'],
        gender: jsondata['gender'],
        image: jsondata['image'],
        episode: jsondata['episode']);
  }
}
