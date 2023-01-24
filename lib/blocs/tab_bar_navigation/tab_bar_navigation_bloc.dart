import 'package:bayteq_challenge/resources/tab_items_provider.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bayteq_challenge/models/tab_item_model.dart';

part 'tab_bar_navigation_event.dart';
part 'tab_bar_navigation_state.dart';

class TabBarNavigationBloc extends Bloc<TabBarNavigationEvent, TabBarNavigationState> {
  TabBarNavigationBloc() : super(TabBarNavigationInitial()) {
    on<TabItemsFetched>((event, emit) async {
      List<TabItem> tabItems;
      try {
        if (state is TabBarNavigationInitial) {
          tabItems = await TabItemsProvider.fetchItems(0);
          emit(TabBarNavigationLoaded(tabItems: tabItems, lastOffset: 3));
        }
        else {
          TabBarNavigationLoaded tabItemsLoaded = state as TabBarNavigationLoaded;
          tabItems = await TabItemsProvider.fetchItems(tabItemsLoaded.lastOffset);
          emit(tabItemsLoaded.copyWith(tabItems: tabItems, lastOffset: tabItemsLoaded.lastOffset + 3));
        }
      } on Exception {
        emit(TabBarNavigationError());
      }
    });
  }
}
