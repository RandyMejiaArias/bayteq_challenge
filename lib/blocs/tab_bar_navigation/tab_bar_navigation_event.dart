part of 'tab_bar_navigation_bloc.dart';

abstract class TabBarNavigationEvent extends Equatable {
  const TabBarNavigationEvent();

  @override
  List<Object> get props => [];
}

class TabItemsFetched extends TabBarNavigationEvent {}