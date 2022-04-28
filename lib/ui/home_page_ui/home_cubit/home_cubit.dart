import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../logical_layer/get_http_servies.dart';
import '../../../models/github_models.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
  final searchController = TextEditingController();
  List<Item> itemList = [];
  List<Item> itemStable = [];
  int numberOfRepo = 100;

  void getDate() {
    emit(LoadingState());
    GetHttpServices.getRepositories().then((value) {
      itemList = value.items!;
      itemStable = value.items!;

      emit(SuccessState());
    }).catchError((onError) {
      emit(FieldState());
    });
  }
  void getDateByDate(date) {
    emit(LoadingState());
    GetHttpServices.getRepositoriesByDate(date).then((value) {
      itemList = value.items!;
      emit(SuccessState());
    }).catchError((onError) {
      emit(FieldState());
    });
  }

  search({required String language}){
    language.isNotEmpty?  itemList = itemStable.where((element) => element.language!=null?element.language!.startsWith(language[0].toUpperCase()):false).toList():itemList=itemStable;
    emit(SuccessState());

  }

}
