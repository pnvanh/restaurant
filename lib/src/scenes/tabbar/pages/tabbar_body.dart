import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/src/constants/app_colors.dart';
import 'package:restaurant/src/scenes/discover/pages/pages.dart';
import 'package:restaurant/src/scenes/history/pages/history_page.dart';
import 'package:restaurant/src/scenes/home/pages/pages.dart';
import 'package:restaurant/src/scenes/profile/pages/profile_page.dart';
import 'package:restaurant/src/scenes/tabbar/blocs/bloc.dart';
import 'package:restaurant/src/scenes/tabbar/widgets/widgets.dart';

class TabbarBody extends StatelessWidget {
  final components = TabbarComponents();

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        BlocProvider.of<TabbarBloc>(context).add(TabbarHomeSelected());
        break;
      case 1:
        BlocProvider.of<TabbarBloc>(context).add(TabbarDiscoverSelected());
        break;
      case 2:
        BlocProvider.of<TabbarBloc>(context).add(TabbarProfileSelected());
        break;
      default:
    }
  }

  int _selectedIndex(TabbarStatus status) {
    switch (status) {
      case TabbarStatus.Home:
        return 0;
      case TabbarStatus.Discover:
        return 1;
      case TabbarStatus.Profile:
        return 2;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: PrimaryAppBar(),
        extendBody: true,
        backgroundColor: AppColors.backgroudColor,
        body: BlocBuilder<TabbarBloc, TabbarState>(
          builder: (context, state) {
            return IndexedStack(
                index: _selectedIndex(state.status),
                children: components.children);
          },
        ),
        bottomNavigationBar: BlocBuilder<TabbarBloc, TabbarState>(
          builder: (context, state) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                child: BottomNavigationBar(
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  backgroundColor: Colors.white,
                  fixedColor: AppColors.jungleGreen,
                  unselectedItemColor: AppColors.gray,
                  type: BottomNavigationBarType.fixed,
                  items: components.items,
                  currentIndex: _selectedIndex(state.status),
                  onTap: (index) => _onItemTapped(index, context),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class TabbarComponents {
  final items = [
    BottomNavigationBarItem(
      activeIcon: SvgPicture.asset('assets/icons/ic_home_fill.svg'),
      icon: SvgPicture.asset('assets/icons/ic_home.svg'),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      activeIcon: SvgPicture.asset('assets/icons/ic_bookmark_fill.svg'),
      icon: SvgPicture.asset('assets/icons/ic_bookmark.svg'),
      label: 'Notification',
    ),
    BottomNavigationBarItem(
      activeIcon: SvgPicture.asset('assets/icons/ic_profile_fill.svg'),
      icon: SvgPicture.asset('assets/icons/ic_profile.svg'),
      label: 'Profile',
    ),
  ];

  final children = [
    HomePage(),
    HistoryPage(),
    ProfilePage(),
  ];
}
