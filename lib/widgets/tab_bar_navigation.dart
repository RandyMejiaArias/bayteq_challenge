import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bayteq_challenge/widgets/tab_bar_list.dart';
import '../blocs/tab_bar_navigation/tab_bar_navigation_bloc.dart';

class TabBarNavigation extends StatefulWidget {
  const TabBarNavigation({Key? key}) : super(key: key);

  @override
  State<TabBarNavigation> createState() => _TabBarNavigationState();
}

class _TabBarNavigationState extends State<TabBarNavigation> {
  late TabBarNavigationBloc _tabBarNavigationBloc;

  @override
  void initState() {
    super.initState();
    _tabBarNavigationBloc = context.read<TabBarNavigationBloc>();
  }

  Future<void> _onRefresh() async {
    _tabBarNavigationBloc.add(TabItemsFetched());
    
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBarNavigationBloc, TabBarNavigationState>(
      builder: (context, state) {
        if (state is TabBarNavigationInitial) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is TabBarNavigationLoaded) {
          return RefreshIndicator(
            onRefresh: _onRefresh,
            child: TabBarList(
              state: state,
            ),
          );
        }
        return const Center(child: Text("Error Fetched Posts"));
      },
    );
  }
}

