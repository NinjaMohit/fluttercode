import 'package:flutter/material.dart';

void main() {
  runApp(const StatefulLifecycle());
}

class StatefulLifecycle extends StatelessWidget {
  const StatefulLifecycle({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: StatefulLifecycleDemo(),
    );
  }
}

class StatefulLifecycleDemo extends StatefulWidget {
  const StatefulLifecycleDemo({super.key});

  @override
  State createState() {
    print("In CreateState");
    return _StatefulLifecycleDemoState();
  }
}

class _StatefulLifecycleDemoState extends State {
  @override
  void initState() {
    super.initState();
    print("In initState method");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("In didChangeDependencies method");
  }

  @override
  void didUpdateWidget(StatefulLifecycleDemo oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("In didUpdateWidget method");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("In deactivate method");
  }

  @override
  void dispose() {
    super.dispose();

    print("In dipose method");
  }

  int _counter = 0;

  Scaffold isActivateScreen() {
    if (_counter != 3) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Stateful LifeCycle Demo"),
          backgroundColor: Colors.red,
          centerTitle: true,
        ),
        body: Center(
          child: Text(
            "Counter : $_counter",
            style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w500,
              color: Colors.red,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _counter++;
            });
          },
          child: const Icon(Icons.add),
        ),
      );
    } else {
      // To artificially cause the entire widget tree to be disposed, consider
      // calling [runApp] with a widget such as [SizedBox.shrink].
      runApp(const SizedBox.shrink());
      return Scaffold(
        appBar: AppBar(
          title: const Text("Activate/Dispose"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: const Center(
          child: Text(
            "Flutter",
            style: TextStyle(fontSize: 35),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    print("In Build method");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isActivateScreen(),
    );
  }
}

/*
  Code output : 

  Connecting to VM Service at ws://127.0.0.1:43983/ufc6uI23fRQ=/ws
flutter: In CreateState
flutter: In initState method
flutter: In didChangeDependencies method
4
flutter: In Build method
flutter: In deactivate method
flutter: In dipose method
Lost connection to device.

Exited.

*/