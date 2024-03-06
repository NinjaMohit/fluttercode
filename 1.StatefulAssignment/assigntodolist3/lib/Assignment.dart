import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  final name = TextEditingController();
  final lastname = TextEditingController();
  final contactno = TextEditingController();

  List names = [];
  List lastnames = [];
  List contactnumber = [];

  int index = 0;

  Container card() {
    return Container(
      decoration: const BoxDecoration(color: Colors.blue),
      height: 150,
      width: 400,
      child: Column(
        children: [
          Text(' Name:- ${names[names.length - 1]}'),
          Text(' Name:- ${lastnames[names.length - 1]}'),
          Text(' Name:- ${contactnumber[names.length - 1]}'),
          // const Text("------"),
          // Text(name.text),
          // Text(lastname.text),
          // Text(contactno.text),

          Text("${names[index - 1]}"),
          Text("${lastnames[index - 1]}"),
          Text("${contactnumber[index - 1]}"),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Appbar"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 40,
                  width: 400,
                  child: TextField(
                    controller: name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: "Enter a Name",
                    ),
                    autofocus: true,
                    showCursor: true,
                    keyboardType: TextInputType.name,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 40,
                  width: 400,
                  child: TextField(
                    controller: lastname,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: " Enter a Last Name"),
                    autofocus: true,
                    showCursor: true,
                    keyboardType: TextInputType.name,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 40,
                  width: 400,
                  child: TextField(
                    controller: contactno,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: "Enter a contact No"),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      // if (names.length > index) {

                      // }
                      names.add(name.text);
                      lastnames.add(lastname.text);
                      contactnumber.add(contactno.text);
                      index++;
                    });
                  },
                  child: const Text("Submit"),
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    Container(
                      height: 150,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: names.length,
                        itemBuilder: (context, index) {
                          return card();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
