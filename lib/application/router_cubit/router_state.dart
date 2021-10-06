part of 'router_cubit.dart';

abstract class RouterState extends Equatable {
  const RouterState();

  @override
  List<Object?> get props => [];
}

class Page1State extends RouterState {
  final String? extraPageContent;

  String get urlPath => (extraPageContent?.isEmpty ?? true)
      ? "/page1"
      : "/page1/${extraPageContent!.replaceAll(" ", "-")}";

  const Page1State([this.extraPageContent]);

  @override
  List<Object?> get props => [extraPageContent];
}

class Page2State extends RouterState {
  final String? extraPageContent;

  String get urlPath => (extraPageContent?.isEmpty ?? true)
      ? "/page2"
      : "/page2/${extraPageContent!.replaceAll(" ", "-")}";

  const Page2State([this.extraPageContent]);

  @override
  List<Object?> get props => [extraPageContent];
}

class Page3State extends RouterState {
  final String? extraPageContent;

  String get urlPath => (extraPageContent?.isEmpty ?? true)
      ? "/page3"
      : "/page3/${extraPageContent!.replaceAll(" ", "-")}";

  const Page3State([this.extraPageContent]);

  @override
  List<Object?> get props => [extraPageContent];
}

class Page4State extends RouterState {
  final String? extraPageContent;

  String get urlPath => (extraPageContent?.isEmpty ?? true)
      ? "/page4"
      : "/page4/${extraPageContent!.replaceAll(" ", "-")}";

  const Page4State([this.extraPageContent]);

  @override
  List<Object?> get props => [extraPageContent];
}
