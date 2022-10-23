import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_ex/layout/cubit/states_screen.dart';
import 'package:news_app_ex/model/business_model.dart';
import 'package:news_app_ex/model/search_model.dart';
import 'package:news_app_ex/module/business_screen.dart';
import 'package:news_app_ex/module/science_screen.dart';
import 'package:news_app_ex/module/sports_screen.dart';
import 'package:news_app_ex/shared/network/dio_helper.dart';

import '../../model/science_model.dart';
import '../../model/sports_model.dart';

class NewsLayoutCubit extends Cubit<NewsLayoutStates> {
  NewsLayoutCubit() : super(InitialNewsLayoutState());

  static NewsLayoutCubit get(context) => BlocProvider.of(context);

  List<Widget> screen = [
    const BusinessScreen(),
    const SportScreen(),
    const ScienceScreen(),
  ];
  List<String> titles = [
    "Business",
    "Sports",
    "Science",
  ];
  int currentIndex = 0;

  void changeBottomNavigator(index) {
    if (index == 1 && responseSport.isEmpty) {

      getSport();
    } else if (index == 2 && responseScience.isEmpty) {

      getScience();
    }
    currentIndex = index;
    emit(ChangeBottomNavigatorState());
  }

  /// Business
  List<BusinessModel> responseBusiness = [];

  void getBusiness() {
    emit(LoadingGetBusinessData());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'business',
        'apiKey': '143c6f9fa1964cdabe9887021002e52a',
      },
    ).then((value) {
      responseBusiness = List<BusinessModel>.from(
          (value.data['articles'] as List)
              .map((e) => BusinessModel.fromJson(e)));
      emit(SuccessGetBusinessData());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetBusinessData(error.toString()));
    });
  }

  /// Sport
  List<SportModel> responseSport = [];

  void getSport() {
    emit(LoadingGetSportData());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'sport',
        'apiKey': '143c6f9fa1964cdabe9887021002e52a',
      },
    ).then((value) {
      responseSport = List<SportModel>.from(
        (value.data['articles'] as List).map(
          (e) => SportModel.fromJson(e),
        ),
      );
      emit(SuccessGetSportData());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetSportData(error.toString()));
    });
  }

  /// Science
  List<ScienceModel> responseScience = [];

  void getScience() {
    emit(LoadingGetScienceData());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'science',
        'apiKey': '143c6f9fa1964cdabe9887021002e52a',
      },
    ).then((value) {
      responseScience = List<ScienceModel>.from(
        (value.data['articles'] as List).map(
              (e) => ScienceModel.fromJson(e),
        ),
      );
      emit(SuccessGetScienceData());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetScienceData(error.toString()));
    });
  }


  /// Science
  List<SearchModel> responseSearch = [];

  void getSearch(String text) {
    responseSearch = [];
    emit(LoadingGetSearchData());
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q' : text,
        'apiKey' : "143c6f9fa1964cdabe9887021002e52a",
      },
    ).then((value) {
      responseSearch = List<SearchModel>.from(
        (value.data['articles'] as List).map(
              (e) => SearchModel.fromJson(e),
        ),
      );
      emit(SuccessGetSearchData());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetSearchData(error.toString()));
    });
  }
}
