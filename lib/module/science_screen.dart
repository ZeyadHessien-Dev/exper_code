import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_ex/layout/cubit/cubit_screen.dart';
import 'package:news_app_ex/layout/cubit/states_screen.dart';
import 'package:news_app_ex/shared/components/components.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsLayoutCubit, NewsLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsLayoutCubit.get(context).responseScience;
        return cubit.isNotEmpty
            ? buildScaffoldItems(cubit)
            : buildCircleProgress();
      },
    );
  }
}
