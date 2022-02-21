import 'package:flutter/material.dart';
import 'package:creativework2/model/course.dart';
import 'package:creativework2/model/user_record.dart';
import 'package:creativework2/viewscreen/cardlist_screen.dart';
import 'package:creativework2/viewscreen/counterdemo_screen.dart';
import 'package:creativework2/viewscreen/error_screen.dart';
import 'package:creativework2/viewscreen/lifecycle_screen.dart';
import 'package:creativework2/viewscreen/listview_screen.dart';
import 'package:creativework2/viewscreen/profile_screen.dart';
import 'package:creativework2/viewscreen/start_screen.dart';
import 'package:creativework2/viewscreen/userhome_screen.dart';

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
        CounterDemoScreen.routeName: (context) => const CounterDemoScreen(),
        LifeCycleScreen.routeName: (context) => const LifeCycleScreen(),
        UserHomeScreen.routeName: (context) {
          Object? args = ModalRoute.of(context)?.settings.arguments;
          if (args != null) {
            return UserHomeScreen(args as UserRecord);
          } else {
            return const ErrorScreen('argument is null at UserHomeScreen');
          }
        },
        CardListScreen.routeName: (context) {
          Object? args = ModalRoute.of(context)?.settings.arguments;
          if (args != null) {
            return CardListScreen(args as List<Course>);
          } else {
            return const ErrorScreen('argument is null at CardList');
          }
        },
        ListViewScreen.routeName: (context) {
          Object? args = ModalRoute.of(context)?.settings.arguments;
          if (args != null) {
            return ListViewScreen(args as List<Course>);
          } else {
            return const ErrorScreen('argument is null at ListViewScreen');
          }
        },
        ProfileScreen.routeName: (context) {
          Object? args = ModalRoute.of(context)?.settings.arguments;
          if (args != null) {
            return ProfileScreen(args as UserRecord);
          } else {
            return const ErrorScreen('argument is null at ProfileScreen');
          }
        },
      },
    );
  }
}
