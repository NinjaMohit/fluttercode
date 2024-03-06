import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
/*
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> users = [];
  void fetch() async {
    print("feching");
    final response = await http.get(
      Uri.parse("https://randomuser.me/api/?results=5"),
    );

    final jsons = json.decode(response.body);

    if (response.statusCode == 200) {
      setState(() {
        users = jsons['results'];
      });
      print("fetching completed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Fecthing"),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          final email = user['email'];
          return Center(
            child: Container(
              color: Colors.amberAccent,
              child: Column(
                children: [Text('${users[index]['email']}'), Text(email)],
              ),
            ),
          );
        },
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: fetch, child: const Text("Add")),
    );
  }
}
*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> users = [];
  void fetch() async {
    print("feching");
    final response = await http.get(
      Uri.parse("assets/sample.json"),
    );

    final jsons = json.decode(response.body);

    if (response.statusCode == 200) {
      setState(() {
        users = jsons['items'];
      });
      print("fetching completed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Fecthing"),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Center(
            child: Column(
              children: [
                Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 2, color: Colors.black),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 106, 244, 1),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${users[index]['id']}'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: fetch, child: const Text("Add")),
    );
  }
}
