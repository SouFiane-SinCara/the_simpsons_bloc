// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_bloc.dart';

abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

class LoadingDataState extends AppState {}

class LoadedDataState extends AppState {
  List<CharacterModel> allcharacters;
  LoadedDataState({
    required this.allcharacters,
  });
}

class ErrorDataState extends AppState {
  String Error;
  ErrorDataState({
    required this.Error,
  });
  
}
