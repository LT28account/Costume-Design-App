import 'package:flutter/material.dart';

class LifeCycleScreen extends StatefulWidget {
  const LifeCycleScreen({Key? key}) : super(key: key);

  static const routeName = '/lifeCycleScreen';

  @override
  State<StatefulWidget> createState() {
    return _LifeCycleState();
  }
}

class _LifeCycleState extends State<LifeCycleScreen> {
  String? gps;

  @override
  void initState() {
    super.initState();
    print('====== LifeCycleScreen: initState()');
    gps = 'allocated';
    print('====== GPS is allocated and in use by LifeCycle');
  }

  @override
  Widget build(BuildContext context) {
    print('====== LifeCycleScreen: build()');
    print('====== $gps');
    return Scaffold(
      appBar: AppBar(
        title: const Text('LifeCycle Demo'),
      ),
      body: const Text('LifeCycle Demo'),
    );
  }

  @override
  void dispose() {
    print('====== LifeCycleScreen: dispose()');
    gps = null; // release so other apps can use
    print('====== GPS released');
    super.dispose();
  }
}
