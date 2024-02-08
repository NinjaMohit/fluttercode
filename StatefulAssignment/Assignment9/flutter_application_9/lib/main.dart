import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Portfolio(),
    );
  }
}

class Portfolio extends StatefulWidget {
  const Portfolio({super.key});

  @override
  State<Portfolio> createState() => _Portfolio();
}

class _Portfolio extends State<Portfolio> {
  int count = -1;

  SizedBox nameContainer() {
    if (count >= 0) {
      return SizedBox(
        height: 250,
        width: 250,
        child: Column(
          children: [
            const Text(
              "Name : Mohit",
              style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Color.fromARGB(234, 70, 4, 109)),
            ),
            Image.network(
              "data:image/jpeg;base64,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",
              height: 150,
              width: 150,
            ),
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  SizedBox collegeContainer() {
    if (count >= 1) {
      return SizedBox(
        height: 250,
        width: 250,
        child: Column(
          children: [
            const Text(
              "College : SKNCOE",
              style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Color.fromARGB(234, 70, 4, 109)),
            ),
            Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSG7f4V_ds6yUN022he3lq5pgHF3RJ8rbAffNpywiKNVw&s",
              height: 150,
              width: 150,
            ),
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  SizedBox dreamCompanyContainer() {
    if (count >= 2) {
      return SizedBox(
        height: 250,
        width: 250,
        child: Column(
          children: [
            const Text(
              "Dream Company : PTC",
              style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Color.fromARGB(234, 70, 4, 109)),
            ),
            Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-RwTjRCGdcm-jcB2Rvcs7CT1RBWAGVOeOFMRAkKAg0A&s",
              height: 150,
              width: 150,
            ),
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }
/*
  Container nameContainer() {
    if (count >= 0) {
      return Container(
        height: 250,
        width: 250,
        child: Column(
          children: [
            const Text("Name : Kartikeyan Charkupalli"),
            Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqgBve3TPKTWWqzXLRIAkNW999uH6n9c8cwg&usqp=CAU",
              height: 150,
              width: 150,
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  Container collegeContainer() {
    if (count >= 1) {
      return Container(
        height: 250,
        width: 250,
        child: Column(
          children: [
            const Text("College : SCOE"),
            Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSG7f4V_ds6yUN022he3lq5pgHF3RJ8rbAffNpywiKNVw&s",
              height: 150,
              width: 150,
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  Container dreamCompanyContainer() {
    if (count >= 2) {
      return Container(
        height: 250,
        width: 250,
        child: Column(
          children: [
            const Text("Dream Company : PTC"),
            Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-RwTjRCGdcm-jcB2Rvcs7CT1RBWAGVOeOFMRAkKAg0A&s",
              height: 100,
              width: 100,
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 212, 247, 230),
      appBar: AppBar(
        title: const Text("Welcome to My Portfolio Page"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            count++;
          });
        },
        child: const Text("Add"),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  nameContainer(),
                  collegeContainer(),
                  dreamCompanyContainer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
