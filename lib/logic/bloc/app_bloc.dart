import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:breaking_bad_app_bloc/data/api/get_characters.dart';
import 'package:breaking_bad_app_bloc/data/models/Character.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(LoadingDataState()) {
    on<AppEvent>((event, emit)  {});
    on<DataEvent>((event, emit) async {
      emit(LoadingDataState());
      try {
        List<CharacterModel> allcharacters =
            await GetCharacters().getcharacters();
        emit(LoadedDataState(allcharacters: allcharacters));
      } catch (e) {
        emit(ErrorDataState(Error: e.toString()));
      }
    },);
  }
}
