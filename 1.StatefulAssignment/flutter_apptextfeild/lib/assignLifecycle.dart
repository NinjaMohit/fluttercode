import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LifeCycle(),
    );
  }
}

class LifeCycle extends StatefulWidget {
  const LifeCycle({super.key});

  @override
  State<LifeCycle> createState() {
    print("createState");
    return _LifeCycleState();
  }
}

class _LifeCycleState extends State<LifeCycle> {
  final mycontroller1 = TextEditingController();
  final mycontroller2 = TextEditingController();

  bool deactive = true;

  Scaffold isScreen() {
    if (deactive == true) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              // obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Name",
                labelText: "suuuuuuu",
                fillColor: Colors.blue,
              ),

              /* onSubmitted: (value) {
              name = value;
            },*/
              controller: mycontroller1,
            ),
            const SizedBox(
              height: 50,
            ),
            TextField(
              // obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Last Name",
                labelText: "suuuuuuu",
                fillColor: Colors.blue,
              ),

              /* onSubmitted: (value) {
              name = value;
            },*/

              controller: mycontroller2,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.yellowAccent,
              height: 200,
              width: 200,
              child: Column(
                children: [Text(mycontroller1.text), Text(mycontroller2.text)],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    print("setState");
                  });
                },
                child: const Text("Submit")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    deactive = false;
                    deactivate();
                  });
                },
                child: const Text("Deactivate")),
          ],
        ),
      );
    } else {
      runApp(const SizedBox.shrink());
      return Scaffold();
    }
  }

  @override
  void initState() {
    super.initState();
    print("initState");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("didChangeDependencie");
  }

  @override
  void didUpdateWidget(covariant LifeCycle oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("deactive");
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
