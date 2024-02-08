import 'package:flutter/material.dart';

class Assignment1 extends StatefulWidget {
  const Assignment1({super.key});

  @override
  State<Assignment1> createState() => _App();
}

class _App extends State<Assignment1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: const Text(
          " App Bar",
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 20, color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.notification_add)),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.alarm),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.group)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search))
        ],
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          side: BorderSide(width: 1, color: Colors.black),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(10),
          child: SizedBox(),
        ),
      ),
    );
  }
}
