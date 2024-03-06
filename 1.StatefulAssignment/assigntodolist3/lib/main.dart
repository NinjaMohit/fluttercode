import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Assignment(),
    );
  }
}

class Assignment extends StatefulWidget {
  const Assignment({super.key});

  @override
  State createState() {
    return _AssignmentState();
  }
}

class _AssignmentState extends State {
  final mycontroller1 = TextEditingController();
  final mycontroller2 = TextEditingController();
  final mycontroller3 = TextEditingController();

  List allname = [];
  List lastname = [];
  List contactno = [];

  int index = 0;
  Container access() {
    return Container(
      color: Colors.blue,
      child: Column(
        children: [
          SizedBox(
            child: Text('Employee Name:- ${allname[allname.length - 1].text}'),
          ),
          SizedBox(
            child: Text('Compony Name:- ${lastname[allname.length - 1].text}'),
          ),
          SizedBox(
            child: Text('Package:- ${contactno[allname.length - 1].text}'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Assignment"),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 40,
              width: 400,
              child: TextField(
                controller: mycontroller1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Enter A Name",
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 40,
              width: 400,
              child: TextField(
                controller: mycontroller2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Enter a LastName",
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 40,
              width: 400,
              child: TextField(
                controller: mycontroller3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Enter a Contact No",
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                allname.add(mycontroller1);
                lastname.add(mycontroller2);
                contactno.add(mycontroller3);
                setState(() {
                  index++;
                });
              },
              child: const Text('Submit'),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                Container(
                  height: 150,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: allname.length,
                    itemBuilder: (context, index) {
                      return access();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
