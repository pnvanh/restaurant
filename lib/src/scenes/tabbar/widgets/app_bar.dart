import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/src/constants/constants.dart';
import 'package:restaurant/src/scenes/tabbar/blocs/bloc.dart';

class PrimaryAppBar extends AppBar {
  PrimaryAppBar()
      : super(
          elevation: 0,
          centerTitle: false,
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.backgroudColor,
          title: BlocBuilder<TabbarBloc, TabbarState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    state.status.name,
                    style: AppTextStyles.appBar(),
                  ),
                  Visibility(
                    visible: state.status.index == 0 ? true : false,
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset('assets/icons/ic_location.svg'),
                        Text(
                          'Agrabad 435, Chittagong',
                          style: AppTextStyles.textRegular(
                            12,
                            AppColors.grayChateau,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            },
          ),
          actions: [
            IconButton(
              icon: Image.asset('assets/images/avatar.png'),
              iconSize: 50,
              onPressed: () {},
            )
          ],
        );
}
