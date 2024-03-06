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
      home: HomePage(),
    );
  }
}

String stringResponse = '';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map mapResponse = {};
  Map dataResponse = {};

  Future apicall() async {
    http.Response response;
    response = await http.get(Uri.parse("https://reqres.in/api/users/2"));
    if (response.statusCode == 200) {
      setState(() {
        stringResponse = response.body;
        mapResponse = json.decode(stringResponse);
        dataResponse = mapResponse["data"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Fetch"),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Text(
          //  mapResponse['data'].toString(),
          dataResponse['id'].toString(),
        ),
      ),
      floatingActionButton: FloatingActionButton.small(onPressed: apicall),
    );
  }
}
