import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_ex/layout/cubit/cubit_screen.dart';
import 'package:news_app_ex/shared/bloc_observer.dart';
import 'package:news_app_ex/shared/dark_mode/cubit/darkmode_cubit.dart';
import 'package:news_app_ex/shared/dark_mode/cubit/darkmode_states.dart';
import 'package:news_app_ex/shared/network/cache_helper.dart';
import 'package:news_app_ex/shared/network/dio_helper.dart';
import 'package:news_app_ex/shared/styles/theme.dart';
import 'layout/layout_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool isDark = CacheHelper.getBoolData(key: 'isDark') ?? false;
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  bool isDark;

  MyApp(this.isDark, {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsLayoutCubit()..getBusiness(),
        ),
        BlocProvider(
          create: (context) => DarkModeCubit()
            ..changeTheme(
              isShow: isDark,
            ),
        ),
      ],
      child: BlocConsumer<DarkModeCubit,DarkModeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            title: 'News Application',
            debugShowCheckedModeBanner: false,
            theme: DarkModeCubit.get(context).themeData,
            home:  NewsLayoutScreen(),
          );
        },
      ),
    );
  }
}
