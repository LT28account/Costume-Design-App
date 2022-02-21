import 'package:flutter/material.dart';
import 'package:creativework2/model/project_record.dart';
import 'package:creativework2/viewscreen/cardlist_screen.dart';
import 'package:creativework2/viewscreen/project_screen.dart';
import 'package:creativework2/viewscreen/view/view_util.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  static const routeName = '/startScreen';

  @override
  State<StatefulWidget> createState() {
    return _StartState();
  }
}

class _StartState extends State<StartScreen> {
  late _Controller con;
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    con = _Controller(this);
  }

  void render(fn) => setState(fn);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Start Screen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'To Edit a Project:',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              'Please Input a Project Name',
              style: Theme.of(context).textTheme.headline4,
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Enter Project Name',
                    ),
                    autocorrect: false,
                    validator: con.validateProjectName,
                    onSaved: con.saveProjectName,
                  ),
                  ElevatedButton(
                    onPressed: con.editProject,
                    child: Text(
                      'Edit Project',
                      style: Theme.of(context).textTheme.button,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            ElevatedButton(
              onPressed: con.cardListDemo,
              child: const Text('Project Card List'),
            ),
            const SizedBox(
              height: 25.0,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class _Controller {
  late _StartState state;
  _Controller(this.state);
  String? projectName;

  void editProject() {
    FormState? currentState = state.formKey.currentState;
    if (currentState == null) return;
    if (!currentState.validate()) return;
    currentState.save();

    ProjectRecord projectInfo = projectDB.firstWhere(
      (e) => e.projectName == projectName,
      orElse: () => ProjectRecord(),
    );

    if (projectInfo.projectName == '') {
      showSnackBar(
        context: state.context,
        message: 'Authentication failed. Incorrect Project Name',
        seconds: 20,
      );
    } else {
      Navigator.pushNamed(state.context, ProjectScreen.routeName,
          arguments: projectInfo);
    }
  }

  void saveProjectName(String? value) {
    projectName = value;
  }

  String? validateProjectName(String? value) {
    if (value == null || value.isEmpty) {
      return 'No Project Name Provided';
    } else if (value.length < 2) {
      return 'Project Name too short, must be at least 2 charcters';
    } else {
      return null;
    }
  }

  void cardListDemo() {
    Navigator.pushNamed(
      state.context,
      CardListScreen.routeName,
      arguments: projectDB,
    );
  }
}
