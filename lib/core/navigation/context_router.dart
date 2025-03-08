import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension ContextBloc on BuildContext {
  /// Navigates to the given [target] route.
  void goTo(
    String target, {
    Map<String, dynamic> queryParams = const {},
    Object? extra,
  }) {
    // logWarning('pushTo to $target with $queryParams');

    final uri = Uri(
      path: target,
      queryParameters: queryParams,
    );
    return go(uri.toString(), extra: extra);
  }

  /// Navigates to the given [target] route and pushes it to the stack. The target route can
  /// the do context.pop(ReturnValue) to return a value to the previous route, with a value.
  FutureOr<T?> pushTo<T extends Object?>(
    String target, {
    Map<String, dynamic> queryParams = const {},
  }) async {
    // logWarning('pushTo to $target with $queryParams');

    final uri = Uri(
      path: target,
      queryParameters: queryParams,
    );
    return push<T>(uri.toString());
  }

  /// https://pub.dev/documentation/go_router/latest/go_router/GoRouterState-class.html
  GoRouterState get routerState {
    return GoRouterState.of(this);
  }

  Map<String, String> get queryParams {
    return routerState.uri.queryParameters;
  }

  Object? get extra {
    return routerState.extra;
  }
}
