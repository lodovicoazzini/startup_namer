import 'package:english_words/english_words.dart';

/// Data model for the shared state in the app
class AppState {
  final Set<WordPair> saved; // the set of saved word pairs

  /// Constructor
  AppState({this.saved = const <WordPair>{}});

  /// Copy the state object
  ///
  /// If [saved] == none return the copy of the current data
  /// else return the provided data
  AppState copyWith({Set<WordPair>? saved}) =>
      AppState(saved: saved ?? this.saved);
}
