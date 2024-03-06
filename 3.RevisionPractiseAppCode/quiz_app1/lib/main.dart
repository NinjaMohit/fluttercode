import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizApp(),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});
  @override
  State createState() => _QuizAppState();
}

class ModelClass {
  final String? q;
  final int? a;
  final List<String?>? o;

  const ModelClass({this.q, this.a, this.o});
}

class _QuizAppState extends State {
  List allQuestions = [
    const ModelClass(
        q: " When a company is called unicorn   (at which valuation)?",
        o: [
          "1 Million dollars",
          "5 Million dollars",
          "10 Million dollars",
          "1 Billion dollars"
        ],
        a: 3),
    const ModelClass(
        q: "Which unicorn is collapsed from \$22 Billion to less than \$3 Billion now and in crisis?",
        o: ["Byjus", "Boat", "Sugar", "CarDekho"],
        a: 0),
    const ModelClass(
        q: "Which of the follwing is not a IT hub India?",
        o: ["Hydrabad", "Pune", "Mumbai", "Ooty"],
        a: 3),
    const ModelClass(
        q: "Which platform was in banned in Nov 2023 due to user claims of abuse?",
        o: ["Facebook", "Omegle", "Google Meet", "Zoom"],
        a: 1),
    const ModelClass(
        q: "Who acquired BinkIt as of now?",
        o: ["Zomato", "Nuvedo", "Dodge age", "CosIQ"],
        a: 0),
  ];

  bool questionScreen = true;
  int questionIndex = 0;
  int selectedINdex = -1;
  bool pageSelection = false;

  @override
  Widget build(BuildContext context) {
    return isQuestionScreen();
  }

  MaterialStateProperty<Color?>? answerColor(int buttonIndex) {
    if (selectedINdex != -1) {
      if (allQuestions[questionIndex].a == buttonIndex && !pageSelection) {
        return const MaterialStatePropertyAll(Colors.green);
      } else if (buttonIndex == selectedINdex) {
        return const MaterialStatePropertyAll(Colors.red);
      } else {
        return const MaterialStatePropertyAll(Colors.black);
      }
    }
    return const MaterialStatePropertyAll(Colors.black);
  }

  int correctAnswers = 0;

  Scaffold isQuestionScreen() {
    if (questionScreen == true) {
      return Scaffold(
          backgroundColor: const Color.fromARGB(110, 222, 170, 170),
          appBar: AppBar(
            elevation: 15,
            shadowColor: Colors.black,
            backgroundColor: Colors.black,
            title: const Text("QuizApp",
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontFamily: AutofillHints.addressState,
                    fontStyle: FontStyle.italic,
                    color: Colors.white)),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Question",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${questionIndex + 1}/${allQuestions.length}",
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 380,
                  child: Text(
                    " ${allQuestions[questionIndex].q}",
                    style: const TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (selectedINdex == -1) selectedINdex = 0;
                    });
                  },
                  style: ButtonStyle(
                      backgroundColor: answerColor(0),
                      fixedSize: const MaterialStatePropertyAll(Size(200, 50))),
                  child: Text(
                    allQuestions[questionIndex].o[0],
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (selectedINdex == -1) selectedINdex = 1;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: answerColor(1),
                    fixedSize: const MaterialStatePropertyAll(Size(200, 50)),
                  ),
                  child: Text(
                    allQuestions[questionIndex].o[1],
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (selectedINdex == -1) selectedINdex = 2;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: answerColor(2),
                    fixedSize: const MaterialStatePropertyAll(Size(200, 50)),
                  ),
                  child: Text(
                    allQuestions[questionIndex].o[2],
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (selectedINdex == -1) selectedINdex = 3;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: answerColor(3),
                    fixedSize: const MaterialStatePropertyAll(Size(200, 50)),
                  ),
                  child: Text(
                    allQuestions[questionIndex].o[3],
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          floatingActionButton: ElevatedButton(
            onPressed: () {
              setState(() {
                if (selectedINdex != -1) {
                  if (allQuestions[questionIndex].a == selectedINdex) {
                    correctAnswers++;
                  }
                  selectedINdex = -1;
                  if (questionIndex < 4) {
                    questionIndex += 1;
                  } else if (questionIndex == 4) {
                    questionScreen = false;
                  } else {
                    questionIndex = 4;
                  }
                }
              });
            },
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.black)),
            child: const Icon(
              Icons.forward,
            ),
          ));
    } else {
      return Scaffold(
          backgroundColor: const Color.fromARGB(110, 222, 170, 170),
          appBar: AppBar(
            backgroundColor: Colors.brown,
            title: const Text(
              "Finished!",
              style: TextStyle(
                  // fontSize: BouncingScrollSimulation.maxSpringTransferVelocity,
                  fontWeight: FontWeight.w800),
            ),
            centerTitle: true,
          ),
          body: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                  "https://c8.alamy.com/comp/2H3HTYN/congratulation-letter-with-trophy-cup-in-gold-color-winner-trophy-icon-symbol-in-flat-style-vector-illustration-eps8-eps10-2H3HTYN.jpg"),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Your Score is",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "$correctAnswers/${allQuestions.length}",
                style: const TextStyle(fontSize: 25, color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    selectedINdex = -1;
                    questionIndex = 0;
                    correctAnswers = 0;
                    questionScreen = true;
                  });
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black)),
                child: const Text(
                  "Start Again",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ));
    }
  }
}
