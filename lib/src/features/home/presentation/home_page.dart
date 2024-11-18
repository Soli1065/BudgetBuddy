import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../home.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    // Trigger the data fetch on page load
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeProvider.notifier).loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // Trigger the refresh logic
          ref.read(homeProvider.notifier).refreshData();
        },
        child: homeState.isLoading
            ? const Center(child: CircularProgressIndicator())
            : Center(child: Text(homeState.data ?? 'No Data'))
      ),
    );
  }
}
