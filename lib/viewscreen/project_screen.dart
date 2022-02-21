import 'package:flutter/material.dart';
import 'package:creativework2/model/project_record.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen(this.projectRecord, {Key? key}) : super(key: key);

  final ProjectRecord projectRecord;

  static const routeName = '/projectScreen';

  @override
  State<StatefulWidget> createState() {
    return _ProjectState();
  }
}

class _ProjectState extends State<ProjectScreen> {
  late _Controller con;
  bool editMode = false;
  var formKey = GlobalKey<FormState>();
  RangeValues _rangeYardValue = const RangeValues(0, 500);

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
          title: const Text('Project Information'),
          actions: [
            editMode
                ? IconButton(onPressed: con.save, icon: const Icon(Icons.check))
                : IconButton(onPressed: con.edit, icon: const Icon(Icons.edit)),
            IconButton(
                onPressed: con.signOut, icon: const Icon(Icons.exit_to_app)),
          ],
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Project Name',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: TextFormField(
                          enabled: editMode,
                          initialValue: con.tempProject.projectName,
                          validator: con.validateProjectName,
                          onSaved: con.saveProjectName,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Project Cost',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: TextFormField(
                          enabled: editMode,
                          initialValue: '${con.tempProject.cost}',
                          validator: con.validateCost,
                          onSaved: con.saveCost,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Estimated Length of Material Used(in yards):',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue[900]!,
                        width: 2.0,
                      ),
                    ),
                    child: Column(
                      children: [
                        RangeSlider(
                            values: _rangeYardValue,
                            max: 500,
                            divisions: 50,
                            labels: RangeLabels(
                              _rangeYardValue.start.round().toString(),
                              _rangeYardValue.end.round().toString(),
                            ),
                            onChanged: editMode
                                ? (RangeValues values) {
                                    setState(() {
                                      _rangeYardValue = values;
                                    });
                                  }
                                : null),
                      ],
                    ),
                  ),
                  Text(
                    'Reason For Creation:',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue[900]!,
                        width: 2.0,
                      ),
                    ),
                    child: Column(
                      children: [
                        for (var r in Reason.values)
                          RadioListTile(
                            title: Text(r.name),
                            value: r,
                            groupValue: con.tempProject.reason,
                            onChanged: editMode ? con.onChangeReason : null,
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Fabric Used:',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue[900]!,
                        width: 2.0,
                      ),
                    ),
                    child: Column(
                      children: [
                        for (var v in Fabric.values)
                          CheckboxListTile(
                            value: con.tempProject.fabric[v],
                            title: Text(v.name),
                            onChanged: editMode
                                ? (value) => con.onChangeFabric(value, v)
                                : null,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Controller {
  _ProjectState state;
  late ProjectRecord tempProject;

  _Controller(this.state) {
    tempProject = state.widget.projectRecord.clone();
  }
  void signOut() {
    Navigator.of(state.context).pop();
  }

  void save() {
    FormState? currentState = state.formKey.currentState;
    if (currentState == null) return;
    if (!currentState.validate()) return;
    currentState.save();

    state.widget.projectRecord.copyFrom(tempProject);

    state.render(() => state.editMode = false);
  }

  void edit() {
    state.render(() => state.editMode = true);
  }

  String? validateProjectName(String? value) {
    if (value == null || value.length < 2) {
      return 'Invalid Name';
    } else {
      return null;
    }
  }

  void saveProjectName(String? value) {
    if (value != null) tempProject.projectName = value;
  }

  String? validateCost(String? value) {
    if (value == null) {
      return 'Invalid Cost';
    }
    try {
      double cost = double.parse(value);
      if (cost >= 2) {
        return null;
      } else {
        return 'Min Cost is 2';
      }
    } catch (e) {
      return 'Cost Must be an Integer';
    }
  }

  void saveCost(String? value) {
    if (value != null) tempProject.cost = double.parse(value);
  }

  void onChangeReason(Reason? r) {
    if (r != null) {
      state.render(() => tempProject.reason = r);
    }
  }

  void onChangeFabric(bool? b, Fabric key) {
    if (b != null) {
      state.render(() => tempProject.fabric[key] = b);
    }
  }
}
