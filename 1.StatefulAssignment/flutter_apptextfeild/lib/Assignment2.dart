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
//  final FocusNode _focusNode = FocusNode();
  final myController = TextEditingController();
  //final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("hello"),
        backgroundColor: Colors.red,
      ),
      body: const Column(
        children: [
          SizedBox(
            height: 20,
          ),
          TextField()
        ],
      ),
    );
  }
}
