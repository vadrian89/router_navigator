import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_navigation_state.dart';
part 'main_navigation_cubit.freezed.dart';

class MainNavigationCubit extends Cubit<MainNavigationState> {
  MainNavigationCubit() : super(const MainNavigationState.page1());

  Future<void> goToPage1([String? text]) async =>
      emit(MainNavigationState.page1(extraPageContent: text));

  Future<void> goToPage2([String? text]) async =>
      emit(MainNavigationState.page2(extraPageContent: text));

  Future<void> goToPage3([String? text]) async =>
      emit(MainNavigationState.page3(extraPageContent: text));

  Future<void> goToPage4([String? text]) async =>
      emit(MainNavigationState.page4(extraPageContent: text));
}
