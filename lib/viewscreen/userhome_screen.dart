import 'package:flutter/material.dart';
import 'package:creativework2/model/user_record.dart';
import 'package:creativework2/viewscreen/profile_screen.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen(this.user, {Key? key}) : super(key: key);

  static const routeName = '/userHomeScreen';

  final UserRecord user;

  @override
  State<StatefulWidget> createState() {
    return _UserHomeState();
  }
}

class _UserHomeState extends State<UserHomeScreen> {
  late _Controller con;

  @override
  void initState() {
    super.initState();
    con = _Controller(this);
  }

  void render(fn) => setState(fn);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('User Home'),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: con.profile, icon: const Icon(Icons.settings)),
            IconButton(
                onPressed: con.signOut, icon: const Icon(Icons.exit_to_app)),
          ],
        ),
        body: Container(
          color: Colors.teal[200],
          padding: const EdgeInsets.fromLTRB(16.0, 30.0, 10.0, 0.0),
          child: Column(
            children: [
              Text(
                "Welcome to ${widget.user.name}'s Home Page",
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                'email: ${widget.user.email}',
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Controller {
  final _UserHomeState state;
  _Controller(this.state);

  void signOut() {
    Navigator.of(state.context).pop();
  }

  void profile() async {
    await Navigator.pushNamed(
      state.context,
      ProfileScreen.routeName,
      arguments: state.widget.user,
    );
    state.render((){});
  }
}
