import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Assignment2(),
    );
  }
}

class Assignment2 extends StatefulWidget {
  const Assignment2({super.key});

  @override
  State<Assignment2> createState() => _Assignment2State();
}

class _Assignment2State extends State<Assignment2> {
  TextEditingController name = TextEditingController();
  TextEditingController pass = TextEditingController();

  GlobalKey<FormState> key = GlobalKey<FormState>();

  void validate() {
    if (key.currentState!.validate()) {
      // print("Ok");
    } else {
      //  print("error");
    }
  }

  void successlogin() {
    bool loginValidated = key.currentState!.validate();
    if (loginValidated) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Login Succesful",
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Failed")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: key,
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                    hintText: "Enter a names",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          const BorderSide(width: 1, color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            const BorderSide(width: 2, color: Colors.red)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                          width: 2, color: Color.fromARGB(255, 127, 127, 6)),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                          width: 2, color: Color.fromARGB(255, 30, 233, 91)),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "enter a name";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: true,
                  obscuringCharacter: "*",
                  controller: pass,
                  decoration: InputDecoration(
                    hintText: "enter a password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          const BorderSide(width: 1, color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            const BorderSide(width: 2, color: Colors.red)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                          width: 2, color: Color.fromARGB(255, 220, 233, 30)),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                          width: 2, color: Color.fromARGB(255, 30, 233, 91)),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "enter a pass";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    print(name.text + " " + pass.text);
                    validate();
                    successlogin();
                  });
                },
                child: const Text("submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
