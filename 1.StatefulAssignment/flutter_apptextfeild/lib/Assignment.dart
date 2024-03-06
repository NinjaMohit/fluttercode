import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: InputText(),
    );
  }
}

class InputText extends StatefulWidget {
  const InputText({super.key});

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  final FocusNode _focusNode = FocusNode();
  final myController = TextEditingController();
  //final TextEditingController _nameController = TextEditingController();

  List<String> allNames = [
    "Mohit",
    "Sudhir",
    "Umesh",
    "Pratik",
    "Ramesh",
    "nameee"
  ];

  List<String> companyName = [
    "Tcs",
    "infosys",
    "hcl",
    "deloite",
    "capgemini",
    "hcl"
  ];

  List<int> package = [111111, 222222, 333333333, 4444444, 555555, 666666];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("hello"),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: allNames.length,
        itemBuilder: (context, index) {
          return const SizedBox(
            height: 50,
            child: Card(
              child: Column(
                children: [],
              ),
            ),
          );
        },
      ),
    );
  }
}
