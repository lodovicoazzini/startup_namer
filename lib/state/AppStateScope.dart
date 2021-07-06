import 'package:flutter/material.dart';

import 'AppState.dart';

/// Skeleton for the inherited widget
class AppStateScope extends InheritedWidget {
  final AppState data; // the shared state in the app

  /// Constructor
  ///
  /// The [child] will be notified of the changes
  AppStateScope(this.data, {required Widget child}) : super(child: child);

  /// Get the shared data for the given [context]
  static AppState of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppStateScope>()!.data;

  /// Notify to update if the data changed
  @override
  bool updateShouldNotify(covariant AppStateScope oldWidget) =>
      data != oldWidget.data;
}
