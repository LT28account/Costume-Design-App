import 'package:flutter/material.dart';
import 'package:creativework2/model/course.dart';
import 'package:creativework2/viewscreen/view/course_view.dart';
import 'package:creativework2/viewscreen/view/webimage.dart';

class CardListScreen extends StatefulWidget {
  const CardListScreen(this.allCourses, {Key? key}) : super(key: key);

  final List<Course> allCourses;

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
        title: const Text('Card List'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (var course in widget.allCourses)
                CourseView(course),
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
