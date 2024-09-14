import 'dart:developer';

import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tuwaiq_project/data_layer/auth_layer.dart';
import 'package:tuwaiq_project/helper/extinsion/size_config.dart';
import 'package:tuwaiq_project/screens/all_project_screen.dart';
import 'package:tuwaiq_project/screens/auth/login_screen.dart';
import 'package:tuwaiq_project/screens/bottomNavBloc/bottomnav_bloc.dart';
import 'package:tuwaiq_project/screens/profile_screen.dart';
import 'package:tuwaiq_project/screens/search_screen.dart';
import 'package:tuwaiq_project/screens/user_project_screen.dart';
import 'package:tuwaiq_project/services/setup.dart';
import 'package:tuwaiq_project/shape/auth_shape.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  final List<Widget> tabs = const [
    AllProjectScreen(),
    UserProjectScreen(),
    SearchScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomnavBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<BottomnavBloc>();
        return Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: BlocBuilder<BottomnavBloc, BottomnavState>(
            builder: (context, state) {
              int selectedIndex = 0;
              if (state is IndexChangeState) {
                selectedIndex = state.index;
              }
              return FlashyTabBar(
                onItemSelected: (index) {
                  bloc.add(NavigatorBetweenScreenEvent(selectedIndex: index));
                },
                selectedIndex: selectedIndex,
                items: [
                  FlashyTabBarItem(
                    icon: const Icon(
                      Iconsax.home_bold,
                      color: Color.fromARGB(255, 116, 200, 249),
                      size: 30,
                    ),
                    title: const Text('Home'),
                  ),
                  FlashyTabBarItem(
                    icon: const Icon(
                      Iconsax.card_add_bold,
                      color: Color.fromARGB(121, 10, 96, 209),
                      size: 30,
                    ),
                    title: const Text('my project'),
                  ),
                  FlashyTabBarItem(
                    icon: const Icon(
                      Iconsax.profile_2user_bold,
                      color: Colors.blueGrey,
                      size: 30,
                    ),
                    title: const Text('Search'),
                  ),
                  FlashyTabBarItem(
                    icon: const Icon(
                      Iconsax.profile_2user_bold,
                      color: Colors.indigo,
                      size: 30,
                    ),
                    title: const Text('Profile'),
                  ),
                ],
              );
            },
          ),
          body: Column(
            children: [
              CustomPaint(
                size: Size(context.getWidth(multiply: 1),
                    context.getHeight(multiply: 0.1)),
                painter: AuthShape(),
              ),
              BlocBuilder<BottomnavBloc, BottomnavState>(
                builder: (context, state) {
                  int selectedIndex = 0;
                  if (state is IndexChangeState) {
                    selectedIndex = state.index;
                  }
                  return tabs[selectedIndex];
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}
