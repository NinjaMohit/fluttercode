// ignore_for_file: implicit_call_tearoffs

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
      home: Assign(),
    );
  }
}

class Assign extends StatefulWidget {
  const Assign({super.key});

  @override
  State<Assign> createState() => _AssignState();
}

class _AssignState extends State<Assign> {
  TextEditingController name = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController pass = TextEditingController();
  void validate() {
    if (formkey.currentState!.validate()) {
      print("ok");
    } else {
      print("error");
    }
  }

  String nameall(value) {
    if (value.isEmpty) {
      return "Error";
    } else {
      // ignore: null_check_always_fails
      return null!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("hello"),
      ),
      body: Center(
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                width: 300,
                child: TextFormField(
                  controller: name,

                  //enabled: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            const BorderSide(width: 2, color: Colors.black87)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.yellow),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        width: 2,
                        color: Color.fromARGB(255, 98, 139, 96),
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "required";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                width: 300,
                child: TextFormField(
                  controller: name,

                  //enabled: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            const BorderSide(width: 2, color: Colors.black87)),
                  ),
                  validator: nameall,
                ),
              ),

              Container(
                padding: const EdgeInsets.all(10),
                width: 300,
                child: TextFormField(
                  controller: pass,

                  //enabled: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            const BorderSide(width: 2, color: Colors.black87)),
                  ),
                  validator: MultiValidator(
                    [
                      MinLengthValidator(5, errorText: "increase"),
                      EmailValidator(errorText: "wrong"),
                    ],
                  ),
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    print(name.text);
                    validate();
                  });
                  name.clear();
                },
                child: const Text("submit"),
              ),
              // Container(
              //   padding: const EdgeInsets.all(10),
              //   width: 300,
              //   child: TextFormField(
              //     // enabled: false,
              //     obscureText: true,
              //     obscuringCharacter: "*",

              //     decoration: InputDecoration(
              //         hintText: "name",
              //         enabledBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(20),
              //           borderSide: const BorderSide(
              //               width: 2, color: Color.fromARGB(255, 231, 244, 54)),
              //         ),
              //         focusedBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(20),
              //           borderSide: const BorderSide(width: 2, color: Colors.red),
              //         ),
              //         disabledBorder: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(20),
              //             borderSide: const BorderSide(
              //                 width: 2, color: Color.fromARGB(95, 13, 27, 154)))),
              //   ),
              // ),
              // Container(
              //   padding: const EdgeInsets.all(10),
              //   width: 300,
              //   child: TextField(
              //     decoration: InputDecoration(
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(20),
              //         borderSide: const BorderSide(width: 2, color: Colors.red),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
