part of 'freezed_router_cubit.dart';

@freezed
class FreezedRouterState with _$FreezedRouterState {
  const FreezedRouterState._();

  bool get isRootPage => maybeWhen(orElse: () => false, page1: (text) => (text == null));

  String get stateUrl => maybeWhen(
        page1: (text) =>
            (text?.isEmpty ?? true) ? "/page1" : "/page1/${text!.replaceAll(" ", "-")}",
        page2: (text) =>
            (text?.isEmpty ?? true) ? "/page2" : "/page2/${text!.replaceAll(" ", "-")}",
        page3: (text) =>
            (text?.isEmpty ?? true) ? "/page3" : "/page3/${text!.replaceAll(" ", "-")}",
        page4: (text) =>
            (text?.isEmpty ?? true) ? "/page4" : "/page4/${text!.replaceAll(" ", "-")}",
        orElse: () => "/page1",
      );

  const factory FreezedRouterState.page1({String? extraPageContent}) = _Page1;
  const factory FreezedRouterState.page2({String? extraPageContent}) = _Page2;
  const factory FreezedRouterState.page3({String? extraPageContent}) = _Page3;
  const factory FreezedRouterState.page4({String? extraPageContent}) = _Page4;
}
