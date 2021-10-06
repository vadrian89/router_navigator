part of 'freezed_router_cubit.dart';

@freezed
class FreezedRouterState with _$FreezedRouterState {
  const FreezedRouterState._();

  bool get isRootPage => maybeWhen(orElse: () => false, page1: (text) => (text == null));

  const factory FreezedRouterState.page1({String? extraPageContent}) = _Page1;
  const factory FreezedRouterState.page2({String? extraPageContent}) = _Page2;
  const factory FreezedRouterState.page3({String? extraPageContent}) = _Page3;
  const factory FreezedRouterState.page4({String? extraPageContent}) = _Page4;
}
