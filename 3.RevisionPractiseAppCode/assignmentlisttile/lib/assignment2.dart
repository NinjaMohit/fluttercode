import 'package:assignmentlisttile/assign1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Assignmentt(),
    );
  }
}

class Assignmentt extends StatefulWidget {
  const Assignmentt({super.key});

  @override
  State<Assignmentt> createState() => _AssignmenttState();
}

class User {
  final String userName;
  final String password;

  const User({required this.userName, required this.password});
}

class _AssignmenttState extends State<Assignmentt> {
  TextEditingController name = TextEditingController();
  TextEditingController pass = TextEditingController();

  GlobalKey<FormFieldState> namekey = GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> passkey = GlobalKey<FormFieldState>();

  void validate1() {
    if (namekey.currentState!.validate()) {
      print("ok");
    } else {
      print("enter a text");
    }
  }

  void validate2() {
    if (passkey.currentState!.validate()) {
      print("ok");
    } else {
      print("enter a text");
    }
  }

  List<User> userList = const [
    User(
      userName: "Mohit",
      password: "1234",
    ),
  ];

  void succesfullogin() {
    bool nameuser = namekey.currentState!.validate();
    bool passuser = passkey.currentState!.validate();

    String namecont = name.text;
    String passcont = pass.text;
    if (userList[0].userName == namecont && userList[0].password == passcont) {
      if (nameuser && passuser) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Login Succesful")));
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Assignment2(),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Login Failed")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              child: Text(userList[0].userName),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                key: namekey,
                controller: name,
                decoration: InputDecoration(
                  hintText: "Name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(width: 2)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter a text";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                key: passkey,
                controller: pass,
                decoration: InputDecoration(
                  hintText: "Pass",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(width: 2)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter a text";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    print(name.text);
                    print(pass.text);
                    validate1();
                    validate2();
                    succesfullogin();
                  });
                },
                child: const Text("Submit")),
          ],
        ),
      ),
    );
  }
}
