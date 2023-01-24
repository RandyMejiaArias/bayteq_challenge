import 'package:bayteq_challenge/blocs/tab_bar_navigation/tab_bar_navigation_bloc.dart';
import 'package:bayteq_challenge/views/pokemon_view.dart';
import 'package:flutter/material.dart';

class TabBarList extends StatefulWidget {
  final TabBarNavigationLoaded state;

  const TabBarList({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  State<TabBarList> createState() => _TabBarListState();
}

class _TabBarListState extends State<TabBarList> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    var state = widget.state;
    final screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: SizedBox(
        height: screenHeight,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 5,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12)),
                  child: TabBar(
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.red
                    ),
                    controller: tabController,
                    isScrollable: false,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 12.0),
                    tabs: [
                      Tab(
                        child: Text(
                          state.tabItems[0].pokemonName,
                          style: const TextStyle(color: Colors.black)
                        )
                      ),
                      Tab(
                        child: Text(
                          state.tabItems[1].pokemonName,
                          style: const TextStyle(color: Colors.black)
                        )
                      ),
                      Tab(
                        child: Text(
                          state.tabItems[2].pokemonName,
                          style: const TextStyle(color: Colors.black)
                        )
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                key: Key(state.tabItems[0].url),
                children: [
                  PokemonView(url: state.tabItems[0].url),
                  PokemonView(url: state.tabItems[1].url),
                  PokemonView(url: state.tabItems[2].url),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
