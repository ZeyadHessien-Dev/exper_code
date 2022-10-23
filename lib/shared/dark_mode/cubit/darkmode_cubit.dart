import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_ex/layout/cubit/states_screen.dart';

import '../../network/cache_helper.dart';
import '../../styles/theme.dart';
import 'darkmode_states.dart';

class DarkModeCubit extends Cubit<DarkModeStates> {
  DarkModeCubit() : super(InitialDarkModeState());

  static DarkModeCubit get(context) => BlocProvider.of(context);

  ThemeData themeData = lightTheme;
  bool themeIs = true;

  void changeTheme({bool? isShow}) {
    if (isShow != null) {
      emit(Exaa());
      themeData = isShow ? darkTheme : lightTheme;
      print("IsShow != null");
      emit(ChangeDarkModeState());
    } else if (isShow == null) {
      emit(Exaa());
      themeData = themeIs ? darkTheme : lightTheme;
      CacheHelper.setData(key: 'isDark', value: themeIs);
      themeIs = !themeIs;
      print("IsShow == null");
      emit(ChangeDarkModeState());
    }
  }
}
