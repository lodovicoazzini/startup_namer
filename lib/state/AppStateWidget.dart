import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

import 'AppState.dart';
import 'AppStateScope.dart';

/// Widget providing an API for the shared state
class AppStateWidget extends StatefulWidget {
  final Widget child;

  /// Constructor
  AppStateWidget({required this.child});

  /// Create the state
  @override
  State<StatefulWidget> createState() => _AppStateWidgetState();

  /// Get the API Widget for the current [context]
  static _AppStateWidgetState of(BuildContext context) =>
      context.findAncestorStateOfType<_AppStateWidgetState>()!;
}

/// State of the API Widget
class _AppStateWidgetState extends State<AppStateWidget> {
  /// The initial app state
  AppState _data = AppState();

  /// Set the saved set to [newSaved]
  setSaved(Set<WordPair> newSaved) {
    if (_data.saved != newSaved) {
      setState(() {
        _data = _data.copyWith(saved: newSaved);
      });
    }
  }

  /// Add [pair] to the saved set
  addPair(WordPair pair) {
    Set<WordPair> newSaved = Set<WordPair>.from(_data.saved);
    newSaved.add(pair);
    setState(() {
      _data = _data.copyWith(saved: newSaved);
    });
  }

  /// Remove [pair] to the saved set
  removePair(WordPair pair) {
    Set<WordPair> newSaved = Set<WordPair>.from(_data.saved);
    newSaved.remove(pair);
    setState(() {
      _data = _data.copyWith(saved: newSaved);
    });
  }

  /// Register the child in the widgets hierarchy
  @override
  Widget build(BuildContext context) =>
      AppStateScope(_data, child: widget.child);
}
