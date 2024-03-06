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
  final TextEditingController _nameController = TextEditingController();
  final FocusNode _nodeFocus = FocusNode();

  void _printLatestValue() {
    final text = _nameController.text;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("hello"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          TextField(
            // onSubmitted: (value) {
            //   name = value;
            //   setState(() {});
            // },
            controller: _nameController,
            focusNode: _nodeFocus,
            autofocus: true,
            decoration: const InputDecoration(
              hintText: "enter name",
              hintStyle: TextStyle(fontWeight: FontWeight.w500),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const TextField(),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 200,
            width: 200,
            color: const Color.fromARGB(255, 173, 138, 32),
            child: Text(_nameController.text),
          ),
        ],
      ),
    );
  }
}
