import "package:flutter/material.dart";

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
  State<StatefullCycle> createState() {
    print("CreateState");
    return _StatefullCycleState();
  }
}

class _StatefullCycleState extends State<StatefullCycle> {
  int count = 0;

  Scaffold isScreen() {
    if (count != 3) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("StateFulLifeCycle"),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: SizedBox(
            child: Text("Counter : +$count"),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              print("setState");
              count++;
            });
          },
          child: const Icon(Icons.add),
        ),
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
  void initState() {
    // TODO: implement initState
    super.initState();
    print("init");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("didChangeDependency");
  }

  @override
  void didUpdateWidget(covariant StatefullCycle oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("didUpdateWIdget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print(" deactivate ");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("dispose");
  }

  @override
  Widget build(BuildContext context) {
    print("Build");
    return isScreen();
  }
}
