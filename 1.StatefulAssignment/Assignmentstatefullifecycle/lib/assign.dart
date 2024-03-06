import 'package:assign_statefullifecycle/assignment.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: StatefullCycle(),
    );
  }
}

class StatefullCycle extends StatefulWidget {
  const StatefullCycle({super.key});

  @override
  State createState() {
    print("create State");
    return _StatefullCycleState();
  }
}

class _StatefullCycleState extends State {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initState");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("didChangeDependency");
  }

  @override
  void didUpdateWidget(covariant StatefulWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("did updateWidget");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("deactivate");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("dispose");
  }

  int count = 0;
  Scaffold isScreen() {
    if (count != 3) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Appbar"),
        ),
        body: Center(
          child: Column(
            children: [
              Text("Counter : +$count"),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          setState(() {
            count++;
          });
        }),
      );
    } else {
      runApp(const SizedBox.shrink());
      return Scaffold(
        appBar: AppBar(
          title: const Text(" Active /Deactive StateFulLifeCycle"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return isScreen();
  }
}
