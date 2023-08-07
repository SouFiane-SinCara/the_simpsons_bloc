// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class DataEvent extends AppEvent {
 
}
