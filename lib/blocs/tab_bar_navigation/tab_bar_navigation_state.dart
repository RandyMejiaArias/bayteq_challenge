part of 'tab_bar_navigation_bloc.dart';

abstract class TabBarNavigationState extends Equatable {
  const TabBarNavigationState();
  
  @override
  List<Object> get props => [];
}

class TabBarNavigationInitial extends TabBarNavigationState {}

class TabBarNavigationLoaded extends TabBarNavigationState {
  final List<TabItem> tabItems;
  final int lastOffset;

  TabBarNavigationLoaded({
    this.tabItems = const <TabItem>[],
    required this.lastOffset
  });

  TabBarNavigationLoaded copyWith({
    required List<TabItem> tabItems,
    required int lastOffset
  }) {
    return TabBarNavigationLoaded(
      tabItems: tabItems,
      lastOffset: lastOffset
    );
  }

  @override
  List<Object> get props => [tabItems, lastOffset];
}

class TabBarNavigationError extends TabBarNavigationState {}