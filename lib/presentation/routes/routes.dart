// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:breaking_bad_app_bloc/constants/routes_names.dart';
import 'package:breaking_bad_app_bloc/data/models/Character.dart';
import 'package:breaking_bad_app_bloc/logic/bloc/app_bloc.dart';
import 'package:breaking_bad_app_bloc/presentation/screens/characters_details.dart';
import 'package:breaking_bad_app_bloc/presentation/screens/characters_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyRoutes {
  final blocapp = AppBloc()..add(DataEvent());
  Route? generatorRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case CharatersPage:
        return MaterialPageRoute(
          builder: (context) =>
              BlocProvider.value(value: blocapp, child: CharactersHome()),
        );
      case DetailCharacter:
        return MaterialPageRoute(
          builder: (context) => DetailsCharacters(
            characterModel: routeSettings.arguments as CharacterModel,
          ),
        );
    }
  }
}
