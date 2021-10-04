part of 'main_navigation_cubit.dart';

@freezed
class MainNavigationState with _$MainNavigationState {
  const MainNavigationState._();

  bool get isRootPage => maybeWhen(orElse: () => false, page1: (text) => (text == null));

  const factory MainNavigationState.page1({String? extraPageContent}) = _Page1;
  const factory MainNavigationState.page2({String? extraPageContent}) = _Page2;
  const factory MainNavigationState.page3({String? extraPageContent}) = _Page3;
  const factory MainNavigationState.page4({String? extraPageContent}) = _Page4;
}
