import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Assignment3(),
    );
  }
}

class Assignment3 extends StatefulWidget {
  const Assignment3({super.key});

  @override
  State<Assignment3> createState() => _App();
}

class _App extends State<Assignment3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MovieFlix",
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add_alert,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.group,
                color: Colors.black,
              ))
        ],
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
              size: 30,
            )),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(6), bottomRight: Radius.circular(6)),
          side: BorderSide(width: 2, color: Colors.black),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(10),
          child: SizedBox(),
        ),
        elevation: 10,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(6),
              bottomRight: Radius.circular(6),
            ),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 81, 227, 222),
                Color.fromARGB(255, 240, 122, 226),
                Color.fromARGB(255, 15, 141, 200),
                Color.fromARGB(255, 118, 182, 224),
              ],
              transform: GradientRotation(95),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromARGB(225, 118, 182, 224),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Movies",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.network(
                        "https://assets-in.bmscdn.com/discovery-catalog/events/tr:w-400,h-600,bg-CCCCCC/et00311762-lmdexnggxy-portrait.jpg",
                        height: 300,
                        width: 400,
                      ),
                      Image.network(
                        "https://assets-in.bmscdn.com/discovery-catalog/events/tr:w-400,h-600,bg-CCCCCC/et00311762-lmdexnggxy-portrait.jpg",
                        height: 300,
                        width: 400,
                      ),
                      Image.network(
                        "https://assets-in.bmscdn.com/discovery-catalog/events/tr:w-400,h-600,bg-CCCCCC/et00311762-lmdexnggxy-portrait.jpg",
                        height: 300,
                        width: 400,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Your content goes here!',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                    ]),
              ),
              const Text(
                "WebSeries",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  Image.network(
                    "https://assets-in.bmscdn.com/discovery-catalog/events/tr:w-400,h-600,bg-CCCCCC/et00311762-lmdexnggxy-portrait.jpg",
                    height: 300,
                    width: 400,
                  ),
                  Image.network(
                    "https://assets-in.bmscdn.com/discovery-catalog/events/tr:w-400,h-600,bg-CCCCCC/et00311762-lmdexnggxy-portrait.jpg",
                    height: 300,
                    width: 400,
                  ),
                  Image.network(
                    "https://assets-in.bmscdn.com/discovery-catalog/events/tr:w-400,h-600,bg-CCCCCC/et00311762-lmdexnggxy-portrait.jpg",
                    height: 300,
                    width: 400,
                  ),
                ]),
              ),
              const Text(
                "Popular Movie",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  Container(
                    height: 200,
                    width: 200,
                    child: Image.network(
                      "https://assets-in.bmscdn.com/discovery-catalog/events/tr:w-400,h-600,bg-CCCCCC/et00311762-lmdexnggxy-portrait.jpg",
                      height: 200,
                      width: 200,
                    ),
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    child: Image.network(
                      "https://assets-in.bmscdn.com/discovery-catalog/events/tr:w-400,h-600,bg-CCCCCC/et00311762-lmdexnggxy-portrait.jpg",
                      height: 200,
                      width: 200,
                    ),
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    child: Image.network(
                      "https://assets-in.bmscdn.com/discovery-catalog/events/tr:w-400,h-600,bg-CCCCCC/et00311762-lmdexnggxy-portrait.jpg",
                      height: 200,
                      width: 200,
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
