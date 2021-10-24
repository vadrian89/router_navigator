import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:router_navigator/application/freezed_router/freezed_router_cubit.dart';

class FreezedRootRouterParser extends RouteInformationParser<FreezedRouterState> {
  const FreezedRootRouterParser();

  @override
  Future<FreezedRouterState> parseRouteInformation(RouteInformation routeInformation) {
    final uri = Uri.parse(routeInformation.location ?? "");
    if (uri.pathSegments.isNotEmpty) {
      return SynchronousFuture(_parseStateFromUri(uri));
    } else {
      return SynchronousFuture(const FreezedRouterState.page1());
    }
  }

  FreezedRouterState _parseStateFromUri(Uri uri) {
    if (uri.pathSegments.contains("page1")) {
      return _parsePage1State(uri);
    } else if (uri.pathSegments.contains("page2")) {
      return _parsePage2State(uri);
    } else if (uri.pathSegments.contains("page3")) {
      return _parsePage3State(uri);
    } else if (uri.pathSegments.contains("page4")) {
      return _parsePage4State(uri);
    } else {
      return const FreezedRouterState.page1();
    }
  }

  FreezedRouterState _parsePage1State(Uri uri) {
    if (uri.pathSegments.length > 1) {
      return FreezedRouterState.page1(extraPageContent: uri.pathSegments[1].replaceAll("-", " "));
    } else {
      return const FreezedRouterState.page1();
    }
  }

  FreezedRouterState _parsePage2State(Uri uri) {
    if (uri.pathSegments.length > 1) {
      return FreezedRouterState.page2(extraPageContent: uri.pathSegments[1].replaceAll("-", " "));
    } else {
      return const FreezedRouterState.page2();
    }
  }

  FreezedRouterState _parsePage3State(Uri uri) {
    if (uri.pathSegments.length > 1) {
      return FreezedRouterState.page3(extraPageContent: uri.pathSegments[1].replaceAll("-", " "));
    } else {
      return const FreezedRouterState.page3();
    }
  }

  FreezedRouterState _parsePage4State(Uri uri) {
    if (uri.pathSegments.length > 1) {
      return FreezedRouterState.page4(extraPageContent: uri.pathSegments[1].replaceAll("-", " "));
    } else {
      return const FreezedRouterState.page4();
    }
  }

  @override
  RouteInformation restoreRouteInformation(FreezedRouterState configuration) =>
      RouteInformation(location: configuration.stateUrl);
}
