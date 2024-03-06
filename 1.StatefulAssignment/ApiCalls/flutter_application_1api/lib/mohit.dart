import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  void fetchData() async {
    final response = await http.get(
      Uri.parse("assets/sample.json"),
    );
    final jsons = json.decode(response.body);
    if (response.statusCode == 200) {
      setState(() {});
      users = jsons['items'];
    } else {
      throw Exception("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("appbar"),
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return Center(
              child: Column(
                children: [
                  Text('${users[index]["id"]}'),
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(onPressed: fetchData),
    );
  }
}
