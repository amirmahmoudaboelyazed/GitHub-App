part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class LoadingState extends HomeState {}
class SuccessState extends HomeState {}
class FieldState extends HomeState {}
class ChangeNumber extends HomeState {}
