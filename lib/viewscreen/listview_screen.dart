import 'package:flutter/material.dart';
import 'package:creativework2/model/course.dart';
import 'package:creativework2/viewscreen/view/course_view.dart';
import 'package:creativework2/viewscreen/view/view_util.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen(this.allCourses, {Key? key}) : super(key: key);

  static const routeName = '/listViewScreen';

  final List<Course> allCourses;
  @override
  State<StatefulWidget> createState() {
    return _ListViewState();
  }
}

class _ListViewState extends State<ListViewScreen> {
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
        title: const Text('List View Demo Screen'),
        actions: con.selected.isEmpty
            ? null
            : [
                IconButton(
                    onPressed: con.delete, icon: const Icon(Icons.delete)),
                IconButton(
                    onPressed: con.cancel, icon: const Icon(Icons.cancel)),
              ],
      ),
      body: ListView.builder(
        itemCount: widget.allCourses.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: con.selected.contains(index)
                ? con.selectedColor
                : con.unselectedColor,
            margin: const EdgeInsets.all(10.0),
            child: ListTile(
              title: Text(widget.allCourses[index].number),
              subtitle: Text(widget.allCourses[index].title),
              onTap: () => con.onTap(index),
              onLongPress: () => con.onLongPress(index),
            ),
          );
        },
      ),
    );
  }
}

class _Controller {
  _ListViewState state;
  _Controller(this.state);

  List<int> selected = [];
  final selectedColor = Colors.lime[800];
  final unselectedColor = Colors.lime[200];

  void onLongPress(int index) {
    state.render(() {
      if (selected.contains(index)) {
        selected.remove(index);
      } else {
        selected.add(index);
      }
    });
  }

  void onTap(int index) {
    if (selected.isEmpty) {
      showAlertDialog(
        context: state.context,
        title: 'Detailed Course Information',
        widget: CourseView(state.widget.allCourses[index]),
      );
    } else {
      onLongPress(index);
    }
  }

  void delete() {
    selected.sort();
    for (int i = selected.length - 1; i >= 0; i--) {
      state.widget.allCourses.removeAt(selected[i]);
    }
    state.render(() {
      selected.clear();
    });
  }

  void cancel() {
    state.render(() => selected.clear());
  }
}
