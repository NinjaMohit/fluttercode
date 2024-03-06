import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

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

class QuestionModel {
  final String? question;
  final List<String>? option;
  final int? answerIndex;

  const QuestionModel({this.question, this.option, this.answerIndex});
}

class _QuizAppState extends State {
  List allQuestions = [
    const QuestionModel(
      question: "What is FIFO ?",
      option: [
        "First In Few Out",
        "Few In Few Out",
        "First In First Out",
        "Few In First Out"
      ],
      answerIndex: 2,
    ),
    const QuestionModel(
      question: "T.C of Merge Sort ?",
      option: ["O(nlogn)", "O(logn)", "O(n)", "O(1)"],
      answerIndex: 0,
    ),
    const QuestionModel(
      question: "T.C of Binary Search ?",
      option: ["O(nlogn)", "O(logn)", "O(n)", "O(1)"],
      answerIndex: 1,
    ),
    const QuestionModel(
      question: "T.C of Bubble Sort ?",
      option: ["O(nlogn)", "O(logn)", "O(1)", "O(n*n)"],
      answerIndex: 3,
    ),
    const QuestionModel(
      question: "T.C of Quick Sort ?",
      option: ["O(logn)", "O(nlogn)", "O(1)", "O(n*n)"],
      answerIndex: 1,
    ),
  ];

  bool questionScreen = true;
  int questionIndex = 0;
  int optionindex = -1;
  int correctAnswer = 0;

  MaterialStateProperty<Color?>? answerColor(int selectedAnswerIndex) {
    if (optionindex != -1) {
      if (selectedAnswerIndex == allQuestions[questionIndex].answerIndex) {
        return const MaterialStatePropertyAll(Colors.green); // correct answer
      } else if (selectedAnswerIndex == optionindex) {
        return const MaterialStatePropertyAll(Colors.red); // Incorrect answer
      } else {
        return const MaterialStatePropertyAll(null);
      }
    } else {
      return const MaterialStatePropertyAll(null); // if no option is clicked
    }
  }

  void validateNextPage() {
    if (optionindex == -1) {
      return;
    }

    if (optionindex == allQuestions[questionIndex].answerIndex) {
      correctAnswer++;
    }

    if (optionindex != -1) {
      if (questionIndex < allQuestions.length) {
        questionIndex++;
      }
    }

    optionindex = -1;

    if (questionIndex == allQuestions.length) {
      questionScreen = false;
      return;
    }
  }

  Scaffold isQuestionScreen() {
    if (questionScreen) {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 233, 203, 224),
        appBar: AppBar(
          title: const Text(
            "QuizApp",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Colors.orange,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Questions : ",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "${questionIndex + 1} / ${allQuestions.length}",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 320,
              height: 50,
              child: Center(
                child: Text(
                  allQuestions[questionIndex].question,
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // ======================ElevatedButton 1 ====================
            ElevatedButton(
              onPressed: () {
                if (optionindex == -1) {
                  setState(() {
                    optionindex = 0;
                  });
                }
              },
              style: ButtonStyle(
                fixedSize: const MaterialStatePropertyAll(Size(300, 30)),
                backgroundColor: answerColor(0),
              ),
              child: Text(
                "A. ${allQuestions[questionIndex].option[0]}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),

            // ======================ElevatedButton 2 ====================
            ElevatedButton(
              onPressed: () {
                if (optionindex == -1) {
                  setState(() {
                    optionindex = 1;
                  });
                }
              },
              style: ButtonStyle(
                fixedSize: const MaterialStatePropertyAll(Size(300, 30)),
                backgroundColor: answerColor(1),
              ),
              child: Text(
                "B. ${allQuestions[questionIndex].option[1]}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // ======================ElevatedButton 3 ====================
            ElevatedButton(
              onPressed: () {
                if (optionindex == -1) {
                  setState(() {
                    optionindex = 2;
                  });
                }
              },
              style: ButtonStyle(
                fixedSize: const MaterialStatePropertyAll(Size(300, 30)),
                backgroundColor: answerColor(2),
              ),
              child: Text(
                "C. ${allQuestions[questionIndex].option[2]}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // ======================ElevatedButton 4 ====================
            ElevatedButton(
              onPressed: () {
                if (optionindex == -1) {
                  setState(() {
                    optionindex = 3;
                  });
                }
              },
              style: ButtonStyle(
                fixedSize: const MaterialStatePropertyAll(Size(300, 30)),
                backgroundColor: answerColor(3),
              ),
              child: Text(
                "D. ${allQuestions[questionIndex].option[3]}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              validateNextPage();
            });
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.forward, color: Colors.orange),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: const Color.fromARGB(255, 253, 253, 253),
        appBar: AppBar(
          title: const Text(
            "Quiz App",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Colors.orange,
            ),
          ),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Image.network(
                "https://t3.ftcdn.net/jpg/02/80/01/64/360_F_280016442_I5DcWCRT7JTr5Ut86a9VvqNoOfDt854G.jpg",
                height: 350,
                width: 350,
              ),
              const Text(
                "Your Score Is",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w300,
                  color: Colors.blue,
                ),
              ),
              Text(
                "$correctAnswer / ${allQuestions.length}",
                style: const TextStyle(
                  color: Colors.deepOrangeAccent,
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    optionindex = -1;
                    questionIndex = 0;
                    correctAnswer = 0;
                    questionScreen = true;
                  });
                },
                child: const Text(
                  "Reset",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return isQuestionScreen();
  }
}
