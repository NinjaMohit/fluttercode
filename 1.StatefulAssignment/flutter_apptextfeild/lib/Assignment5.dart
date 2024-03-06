import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TextFieldDemo(),
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  const TextFieldDemo({super.key});

  @override
  State createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController contact = TextEditingController();

  Column onSubmit() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Name : ${name.text}"),
        const SizedBox(
          height: 10,
        ),
        Text("Email : ${email.text}"),
        const SizedBox(
          height: 10,
        ),
        Text("Contact No : ${contact.text}"),
      ],
    );
  }

  bool isSubmit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "TextField Demo",
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 40,
              width: 400,
              child: TextField(
                controller: name,
                decoration: InputDecoration(
                  hintText: "Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  icon: const Icon(Icons.person),
                ),
                keyboardType: TextInputType.name,
                autofocus: true,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
              width: 400,
              child: TextField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  icon: const Icon(Icons.email),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
              width: 400,
              child: TextField(
                controller: contact,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Contact No",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  icon: const Icon(Icons.phone),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {
                isSubmit = true;
                setState(() {});
              },
              child: const Text("Submit"),
            ),
            const SizedBox(
              height: 25,
            ),
            Center(
              child: isSubmit ? onSubmit() : null,
            ),
          ],
        ),
      ),
    );
  }
}
