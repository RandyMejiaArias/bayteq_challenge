import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bayteq_challenge/widgets/tab_bar_navigation.dart';

import '../blocs/tab_bar_navigation/tab_bar_navigation_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocProvider(
          create: (context) => TabBarNavigationBloc()..add(TabItemsFetched()),
          child: const TabBarNavigation(),
        ),
      ),
    );
  }
}
