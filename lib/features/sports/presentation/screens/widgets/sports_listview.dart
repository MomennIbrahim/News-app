import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/business/data/model/news_model.dart';
import 'package:news_app/features/sports/presentation/logic/sports_cubit.dart';

import '../../../../../core/theming/color_manger.dart';
import '../../../../../core/widgets/article_item.dart';

class SportsListview extends StatelessWidget {
  const SportsListview({super.key, required this.sportsModel});

  final NewsModel sportsModel;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: ColorManger.primaryColor,
      onRefresh: () {
        return Future.delayed(
          const Duration(seconds: 1),
          () {
            context.read<SportsCubit>().getSportsData();
          },
        );
      },
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: sportsModel.articles!.length,
        itemBuilder: (context, index) =>
            ArticleItem(model: sportsModel.articles![index]),
      ),
    );
  }
}
