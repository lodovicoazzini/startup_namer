import 'package:flutter/material.dart';
import 'package:startup_namer/state/AppStateScope.dart';

/// View for the list of saved words
class SavedWords extends StatelessWidget {
  /// Build the widget for the view
  @override
  Widget build(BuildContext context) {
    final tiles = AppStateScope.of(context).saved.map((e) => ListTile(
          title: Text(
            e.asPascalCase,
            style: TextStyle(fontSize: 18),
          ),
        ));

    final divided = tiles.isNotEmpty
        ? ListTile.divideTiles(tiles: tiles, context: context).toList()
        : <Widget>[];

    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Suggestions'),
      ),
      body: ListView(
        children: divided,
      ),
    );
  }
}
