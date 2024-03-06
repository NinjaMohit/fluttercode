import 'package:flutter/material.dart';
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
      body: Column(
        children: [
          SizedBox(
            height: 44,
            width: 355,
            child: Row(
              children: [
                Container(
                  height: 20,
                  width: 36.52,
                  child: const Text(
                    "9.41",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                ),
                const Spacer(),
                const Icon(Icons.room),
                const Icon(Icons.wifi),
                const Icon(Icons.battery_charging_full_sharp),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 223,
                width: 30,
                child: Text(
                  "Create an Account",
                  //   style: GoogleFonts.poppins(
                  //       fontWeight: FontWeight.w400, fontSize: 24),
                ),
              ),
              const SizedBox(
                height: 20,
                width: 76,
                child: Text("Full name"),
              ),
              Container(
                height: 56,
                width: 312,
                padding: const EdgeInsets.only(
                    top: 10, left: 24, right: 24, bottom: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1),
                ),
              ),
              const SizedBox(
                height: 20,
                width: 76,
                child: Text("Full name"),
              ),
              Container(
                height: 56,
                width: 312,
                padding: const EdgeInsets.only(
                    top: 10, left: 24, right: 24, bottom: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1),
                ),
              ),
              const SizedBox(
                height: 20,
                width: 76,
                child: Text("Mobile number"),
              ),
              Container(
                height: 56,
                width: 312,
                padding: const EdgeInsets.only(
                    top: 10, left: 24, right: 24, bottom: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1),
                ),
              ),
              const SizedBox(
                height: 20,
                width: 76,
                child: Text("Email ID"),
              ),
              Container(
                height: 56,
                width: 312,
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 24,
                  right: 24,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1),
                ),
              ),
              const SizedBox(
                height: 210,
              ),
              Container(
                height: 56,
                width: 312,
                padding: const EdgeInsets.only(left: 24, right: 24, bottom: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
