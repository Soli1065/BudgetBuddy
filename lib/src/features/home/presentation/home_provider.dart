
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_state.dart';

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref){
  return HomeNotifier();
});

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier() : super(HomeState.initial()){
    _loadData();
  }


  Future<void> _loadData() async {
    await Future.delayed(const Duration(seconds: 3));
    state = state.copyWith(isLoading: false, data: 'Data Loaded!');
  }


}
