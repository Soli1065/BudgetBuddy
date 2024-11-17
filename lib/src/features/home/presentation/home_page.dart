

import 'package:budget_buddy/src/features/home/presentation/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final homeState = ref.watch(homeProvider);

    if (homeState.isLoading){
      return const Center(child: CircularProgressIndicator(),);
    }
    else{
      return Center(child: Text(homeState.data ?? 'No Data'),);
    }


  }
}