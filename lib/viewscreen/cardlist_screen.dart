import 'package:flutter/material.dart';
import 'package:creativework2/viewscreen/view/project_view.dart';
import 'package:creativework2/model/project_record.dart';

class CardListScreen extends StatefulWidget {
  const CardListScreen(this.allProject, {Key? key}) : super(key: key);

  final List<ProjectRecord> allProject;

  static const routeName = '/cardListScreen';

  @override
  State<StatefulWidget> createState() {
    return _CardListState();
  }
}

class _CardListState extends State<CardListScreen> {
  late _Controller con;

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
        title: const Text('Project Card List'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (var project in widget.allProject)
                ProjectView(project),
            ],
          ),
        ),
      ),
    );
  }
}

class _Controller {
  _CardListState state;
  _Controller(this.state);
}
