import 'package:flutter/material.dart';

import 'views/RandomWords.dart';
import 'state/AppStateWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      // Initialize the app state widget
      AppStateWidget(
          child: MaterialApp(
              title: 'Welcome to Flutter', home: RandomWords() // home page
              ));
}
