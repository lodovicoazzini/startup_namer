import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:startup_namer/state/AppStateScope.dart';
import 'package:startup_namer/state/AppStateWidget.dart';

import 'SavedWords.dart';

/// View for the list of random words
class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WordsListState();
}

/// State of the view
class _WordsListState extends State<RandomWords> {
  /// The list of named suggestions
  final _suggestions = <WordPair>[];

  /// Build the widget for the view
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        // Action to navigate to the saved items
        actions: [IconButton(onPressed: _pushSaved, icon: Icon(Icons.list))],
      ),
      body: _buildSuggestions(),
    );
  }

  /// Build the widget for the list of words
  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (BuildContext _context, int i) {
          if (i.isOdd) {
            return Divider(); // odd rows are dividers
          }
          // Divide by 2 and return an integer
          // => actual index without the divider
          final int index = i ~/ 2;
          // when the list screen is filled, create 10 suggestions
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  /// Build the widget for a row
  Widget _buildRow(WordPair pair) {
    final isSaved = AppStateScope.of(context).saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: TextStyle(fontSize: 18),
      ),
      // set the saved icon to the correct state
      trailing: Icon(
        isSaved ? Icons.favorite : Icons.favorite_border,
        color: isSaved ? Colors.red : null,
      ),
      // toggle the saved state
      onTap: () => _savePair(pair),
    );
  }

  /// Toggle the saved state
  _savePair(WordPair pair) {
    setState(() {
      AppStateScope.of(context).saved.contains(pair)
          ? AppStateWidget.of(context).removePair(pair)
          : AppStateWidget.of(context).addPair(pair)(pair);
    });
  }

  /// Show the saved view
  _pushSaved() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => SavedWords()));
  }
}
