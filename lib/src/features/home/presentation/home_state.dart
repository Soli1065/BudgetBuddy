
import 'package:flutter/material.dart';

@immutable
class HomeState {
  final bool isLoading;
  final String? data;

  const HomeState({
    required this.isLoading,
    this.data
  });

  factory HomeState.initial() {
    return const HomeState(isLoading: true, data: null);
  }

  HomeState copyWith({bool? isLoading, String? data}){
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data
    );
  }

}