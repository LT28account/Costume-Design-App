import 'package:flutter/material.dart';
import 'package:creativework2/model/project_record.dart';
import 'package:creativework2/viewscreen/cardlist_screen.dart';
import 'package:creativework2/viewscreen/error_screen.dart';
import 'package:creativework2/viewscreen/project_screen.dart';
import 'package:creativework2/viewscreen/start_screen.dart';

void main() {
  runApp(const CWA2App());
}

class CWA2App extends StatelessWidget {
  const CWA2App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: StartScreen.routeName,
      routes: {
        StartScreen.routeName: (context) => const StartScreen(),
        ProjectScreen.routeName: (context) {
          Object? args = ModalRoute.of(context)?.settings.arguments;
          if (args != null) {
            return ProjectScreen(args as ProjectRecord);
          } else {
            return const ErrorScreen('argument is null at ProjectScreen');
          }
        },
        CardListScreen.routeName: (context) {
          Object? args = ModalRoute.of(context)?.settings.arguments;
          if (args != null) {
            return CardListScreen(args as List<ProjectRecord>);
          } else {
            return const ErrorScreen('argument is null at CardList');
          }
        },
      },
    );
  }
}
