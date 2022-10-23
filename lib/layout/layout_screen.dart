import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_ex/module/search_screen.dart';
import 'package:news_app_ex/shared/components/components.dart';
import 'package:news_app_ex/shared/dark_mode/cubit/darkmode_cubit.dart';

import 'cubit/cubit_screen.dart';
import 'cubit/states_screen.dart';

class NewsLayoutScreen extends StatelessWidget {
  const NewsLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsLayoutCubit, NewsLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(NewsLayoutCubit.get(context).titles[NewsLayoutCubit.get(context).currentIndex]),
            actions: [
              IconButton(
                onPressed: () {
                  navigateTo(
                    context,
                    SearchScreen(),
                  );
                },
                icon: const Icon(
                  Icons.search,
                ),
              ),
              IconButton(
                onPressed: () {
                  DarkModeCubit.get(context).changeTheme();
                },
                icon: const Icon(
                  Icons.dark_mode,
                ),
              ),
            ],
          ),
          body: NewsLayoutCubit.get(context).screen[NewsLayoutCubit.get(context).currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: NewsLayoutCubit.get(context).currentIndex,
            onTap: (index) {
              NewsLayoutCubit.get(context).changeBottomNavigator(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.business,
                ),
                label: 'Business',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.sports_outlined,
                ),
                label: 'Sports',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.science,
                ),
                label: 'Science',
              ),
            ],
          ),
        );
      },
    );
  }
}
