import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Assignment(),
    );
  }
}

class Assignment extends StatefulWidget {
  const Assignment({super.key});

  @override
  State<Assignment> createState() => _AssignmentState();
}

class _AssignmentState extends State<Assignment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 19,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Welcome to New",
                      style: GoogleFonts.jost(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 26.98,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Educourse",
                      style: GoogleFonts.jost(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 37,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              height: 57,
              width: 320,
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28.5),
                        borderSide: const BorderSide(
                            width: 0.5,
                            color: Color.fromARGB(255, 255, 255, 255))),
                    hintText: "Enter your keyword",
                    hintStyle: GoogleFonts.inter(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color.fromRGBO(143, 143, 143, 1),
                      ),
                    ),
                    suffixIcon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    )),
              ),
            ),
          ),
          const SizedBox(
            height: 29,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: MediaQuery.of(context).size.height - 268,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(38),
                          topLeft: Radius.circular(38)),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 33),
                            child: Text(
                              "Course For You",
                              style: GoogleFonts.jost(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 14, left: 20, right: 20),
                              child: Container(
                                height: 242,
                                width: 190,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color.fromRGBO(197, 4, 98, 1),
                                        Color.fromRGBO(0, 3, 112, 1),
                                      ]),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                          top: 15,
                                          bottom: 5),
                                      child: Text(
                                        "UX Designer from Scratch.",
                                        style: GoogleFonts.jost(
                                          textStyle: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17,
                                            color: Color.fromRGBO(
                                                255, 255, 255, 1),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Image.asset(
                                      "img1.png",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 14, right: 20),
                              child: Container(
                                height: 242,
                                width: 190,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color.fromRGBO(0, 77, 228, 1),
                                        Color.fromRGBO(1, 47, 135, 1),
                                      ]),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                          top: 15,
                                          bottom: 5),
                                      child: Text(
                                        "Design Thinking The Beginner",
                                        style: GoogleFonts.jost(
                                          textStyle: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17,
                                            color: Color.fromRGBO(
                                                255, 255, 255, 1),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Image.asset(
                                      "img2.png",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        child: Text(
                          "Course By Category",
                          style: GoogleFonts.jost(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Color.fromRGBO(0, 0, 0, 1),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Container(
                                  height: 36,
                                  width: 36,
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(25, 0, 56, 1),
                                  ),
                                  child: Image.asset("uiux.png"),
                                ),
                              ),
                              const SizedBox(
                                height: 9,
                              ),
                              Text("UI/UX",
                                  style: GoogleFonts.jost(
                                    textStyle: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                    ),
                                  )),
                            ],
                          ),
                          const SizedBox(
                            width: 55,
                          ),
                          Column(
                            children: [
                              Container(
                                height: 36,
                                width: 36,
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(25, 0, 56, 1),
                                ),
                                child: Image.asset("visual.png"),
                              ),
                              const SizedBox(
                                height: 9,
                              ),
                              Text("Visual",
                                  style: GoogleFonts.jost(
                                    textStyle: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                    ),
                                  )),
                            ],
                          ),
                          const SizedBox(
                            width: 35,
                          ),
                          Column(
                            children: [
                              Container(
                                height: 36,
                                width: 36,
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(25, 0, 56, 1),
                                ),
                                child: Image.asset("illis.png"),
                              ),
                              const SizedBox(
                                height: 9,
                              ),
                              Text(
                                "ILLUSTRATON",
                                style: GoogleFonts.jost(
                                  textStyle: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 35,
                          ),
                          Column(
                            children: [
                              Container(
                                height: 36,
                                width: 36,
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(25, 0, 56, 1),
                                ),
                                child: Image.asset("last.png"),
                              ),
                              const SizedBox(
                                height: 9,
                              ),
                              Text("PHOTO",
                                  style: GoogleFonts.jost(
                                    textStyle: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
