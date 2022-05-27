import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/src/constants/app_colors.dart';
import 'package:restaurant/src/constants/app_text_style.dart';
import 'package:restaurant/src/platform/entities/food_entity.dart';
import 'package:restaurant/src/scenes/home/blocs/bloc.dart';
import 'package:restaurant/src/scenes/home/widgets/new_food.dart';
import 'package:restaurant/src/scenes/home/widgets/widget.dart';

class TodayNewArivable extends StatelessWidget {
  const TodayNewArivable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.0),
      child: BlocBuilder<HomeNewBloc, HomeState>(builder: (context, state) {
        List<FoodEntity>? foods;
        if (state is HomeNewListSuccess) {
          foods = state.foods;
        }

        if (foods == null) {
          return Container();
        }
        return Column(
          children: <Widget>[
            ProductContent(
              title: 'Today New Arivable',
              description: 'Best of the today  food list update',
            ),
            NewFood(foods: foods)
          ],
        );
      }),
    );
  }
}
