import 'package:flutter/material.dart';
import 'package:router_navigator/application/router_cubit/router_cubit.dart';

class RootRouterParser extends RouteInformationParser<RouterState> {
  const RootRouterParser();

  @override
  Future<RouterState> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location ?? "");
    if (uri.pathSegments.isNotEmpty) {
      return _parseStateFromUri(uri);
    } else {
      return const Page1State();
    }
  }

  RouterState _parseStateFromUri(Uri uri) {
    if (uri.pathSegments.contains("page1")) {
      return _parsePage1State(uri);
    } else if (uri.pathSegments.contains("page2")) {
      return _parsePage2State(uri);
    } else if (uri.pathSegments.contains("page3")) {
      return _parsePage3State(uri);
    } else if (uri.pathSegments.contains("page4")) {
      return _parsePage4State(uri);
    } else {
      return const Page1State();
    }
  }

  RouterState _parsePage1State(Uri uri) {
    if (uri.pathSegments.length > 1) {
      return Page1State(uri.pathSegments[1].replaceAll("-", " "));
    } else {
      return const Page1State();
    }
  }

  RouterState _parsePage2State(Uri uri) {
    if (uri.pathSegments.length > 1) {
      return Page2State(uri.pathSegments[1].replaceAll("-", " "));
    } else {
      return const Page2State();
    }
  }

  RouterState _parsePage3State(Uri uri) {
    if (uri.pathSegments.length > 1) {
      return Page3State(uri.pathSegments[1].replaceAll("-", " "));
    } else {
      return const Page3State();
    }
  }

  RouterState _parsePage4State(Uri uri) {
    if (uri.pathSegments.length > 1) {
      return Page4State(uri.pathSegments[1].replaceAll("-", " "));
    } else {
      return const Page4State();
    }
  }

  @override
  RouteInformation restoreRouteInformation(RouterState configuration) {
    String path = "/page1";
    if (configuration is Page1State) {
      path = configuration.urlPath;
    } else if (configuration is Page2State) {
      path = configuration.urlPath;
    } else if (configuration is Page3State) {
      path = configuration.urlPath;
    } else if (configuration is Page4State) {
      path = configuration.urlPath;
    }
    return RouteInformation(location: path);
  }
}
