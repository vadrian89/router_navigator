import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_router_state.dart';
part 'freezed_router_cubit.freezed.dart';

class FreezedRouterCubit extends Cubit<FreezedRouterState> {
  FreezedRouterCubit() : super(const FreezedRouterState.page1());

  Future<void> goToPage1([String? text]) async =>
      emit(FreezedRouterState.page1(extraPageContent: text));

  Future<void> goToPage2([String? text]) async =>
      emit(FreezedRouterState.page2(extraPageContent: text));

  Future<void> goToPage3([String? text]) async =>
      emit(FreezedRouterState.page3(extraPageContent: text));

  Future<void> goToPage4([String? text]) async =>
      emit(FreezedRouterState.page4(extraPageContent: text));

  Future<void> popExtra() async {
    state.maybeWhen(
      orElse: () => goToPage1(),
      page2: (_) => goToPage2(),
      page3: (_) => goToPage3(),
      page4: (_) => goToPage4(),
    );
  }

  Future<void> setNewRoutePath(FreezedRouterState state) async {
    state.when(
      page1: (text) => goToPage1(text),
      page2: (text) => goToPage2(text),
      page3: (text) => goToPage3(text),
      page4: (text) => goToPage4(text),
    );
  }
}
