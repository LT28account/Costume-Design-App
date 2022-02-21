import 'package:flutter/material.dart';
import 'package:creativework2/model/course.dart';
import 'package:creativework2/viewscreen/view/webimage.dart';

class CourseView extends StatelessWidget {
  
  const CourseView(this.course, {Key? key}) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lime[200],
      elevation: 16.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              course.number,
              style: Theme.of(context).textTheme.headline4,
            ),
            WebImage(
              context: context,
              url: course.imageURL,
            ),
            Text(
              course.title,
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              'Prerequisite: ${course.prereq}',
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }
}
