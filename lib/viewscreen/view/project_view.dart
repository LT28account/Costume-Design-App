import 'package:flutter/material.dart';
import 'package:creativework2/model/project_record.dart';

class ProjectView extends StatelessWidget {
  
  const ProjectView(this.projectRecord, {Key? key}) : super(key: key);

  final ProjectRecord projectRecord;

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
              projectRecord.projectName,
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              'Cost: ${projectRecord.cost}',
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }
}
