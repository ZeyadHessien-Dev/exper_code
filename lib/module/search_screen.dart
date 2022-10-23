import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_ex/layout/cubit/cubit_screen.dart';
import 'package:news_app_ex/layout/cubit/states_screen.dart';
import 'package:news_app_ex/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsLayoutCubit, NewsLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsLayoutCubit
            .get(context)
            .responseSearch;
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                defaultTextForm(
                  controller: searchController,
                  onChanged: (value) {
                    NewsLayoutCubit.get(context).getSearch(value);
                  },
                  labelText: "Search",
                  prefixIcon: Icons.search,
                  keyboardType: TextInputType.text,
                ),
                if (state is LoadingGetSearchData)
                  const SizedBox(height: 15,),
                if (state is LoadingGetSearchData)
                  const LinearProgressIndicator(),
                const SizedBox(height: 20,),
                Expanded(
                  child: buildList(
                    cubit,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
