import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: QuizApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});
  @override
  State createState() => _QuizAppState();
}

class SingleQuestionIndex {
  final String? question;
  final List<String>? options;
  final int? answerIndex;

  const SingleQuestionIndex({this.question, this.options, this.answerIndex});
}

class _QuizAppState extends State {
  List allQuestions = [
    const SingleQuestionIndex(
      question: " Android is ?",
      options: [
        "Operating system",
        "Web browser",
        "Processor",
        "Web server",
      ],
      answerIndex: 0,
    ),
    const SingleQuestionIndex(
      question: "    Flutter developed by ? ",
      options: ["Oracle", "Apple", "Google", "Facebook"],
      answerIndex: 2,
    ),
    const SingleQuestionIndex(
      question: "Android is based on which of the following language?",
      options: ["C++", "Python", "Java", "Swift"],
      answerIndex: 2,
    ),
    const SingleQuestionIndex(
      question: "Who invented Java Programming?",
      options: [
        "Chris Lattner",
        "James Gosling",
        "Dennis Ritchie",
        "Guido Rossum"
      ],
      answerIndex: 1,
    ),
    const SingleQuestionIndex(
      question: "What is the extension of java code files?",
      options: [" .js", ".txt", ".class", ".java"],
      answerIndex: 3,
    ),
  ];
  bool questionScreen1 = true;
  bool questionscreen2 = false;
  int questionIndex = 0;
  int optionIndex = -1;
  int correctAns = 0;

  MaterialStateProperty<Color> getColor(int buttonNo) {
    if (optionIndex != -1) {
      if (buttonNo == allQuestions[questionIndex].answerIndex) {
        return const MaterialStatePropertyAll(Colors.green);
      } else if (buttonNo == optionIndex) {
        return const MaterialStatePropertyAll(Colors.red);
      } else {
        return const MaterialStatePropertyAll(
          Color.fromARGB(255, 212, 82, 232),
        );
      }
    } else {
      return const MaterialStatePropertyAll(
        Color.fromARGB(255, 212, 82, 232),
      );
    }
  }

  void validateNextPage() {
    if (optionIndex == allQuestions[questionIndex].answerIndex) {
      correctAns++;
    }

    if (optionIndex != -1) {
      if (questionIndex < allQuestions.length) {
        questionIndex++;
      }
    }
    optionIndex = -1;

    if (questionIndex == allQuestions.length) {
      questionScreen1 = false;
    }
  }

  Scaffold isQuestionScreen() {
    if (questionScreen1 == true && questionscreen2 == false) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 212, 82, 232),
          title: const Text(
            "QuizApp ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Image.network(
                "data:image/png;base64,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",
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    questionscreen2 = true;
                  });
                },
                style: const ButtonStyle(
                  side: MaterialStatePropertyAll(
                      BorderSide(width: 1, color: Colors.black87)),
                  backgroundColor: MaterialStatePropertyAll(
                    Color.fromARGB(255, 212, 82, 232),
                  ),
                  fixedSize: MaterialStatePropertyAll(Size(200, 40)),
                ),
                child: const Text(
                  "Start Quiz",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      );
    } else if (questionScreen1 == true && questionscreen2 == true) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 212, 82, 232),
          title: const Text(
            "QuizApp ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
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
                  "${questionIndex + 1}/${allQuestions.length}",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 2),
                  width: 380,
                  height: 60,
                  child: Text(
                    " ${allQuestions[questionIndex].question}",
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                //----------------------------------Button1----------------------------------------------
                ElevatedButton(
                  onPressed: () {
                    if (optionIndex == -1) {
                      setState(() {
                        optionIndex = 0;
                      });
                    }
                  },
                  style: ButtonStyle(
                    side: const MaterialStatePropertyAll(
                        BorderSide(width: 1, color: Colors.black87)),
                    backgroundColor: getColor(0),
                    fixedSize: const MaterialStatePropertyAll(Size(220, 35)),
                  ),
                  child: Text(
                    "A. ${allQuestions[questionIndex].options[0]}",
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //----------------------------------Button2----------------------------------------------
                ElevatedButton(
                  onPressed: () {
                    if (optionIndex == -1) {
                      setState(() {
                        optionIndex = 1;
                      });
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor: getColor(1),
                      side: const MaterialStatePropertyAll(
                          BorderSide(width: 1, color: Colors.black87)),
                      fixedSize: const MaterialStatePropertyAll(Size(220, 35))),
                  child: Text(
                    "B. ${allQuestions[questionIndex].options[1]}",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                //----------------------------------Button3----------------------------------------------
                ElevatedButton(
                  onPressed: () {
                    if (optionIndex == -1) {
                      setState(() {
                        optionIndex = 2;
                      });
                    }
                  },
                  style: ButtonStyle(
                      side: const MaterialStatePropertyAll(
                          BorderSide(width: 1, color: Colors.black87)),
                      backgroundColor: getColor(2),
                      fixedSize: const MaterialStatePropertyAll(Size(220, 35))),
                  child: Text(
                    "C. ${allQuestions[questionIndex].options[2]}",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //----------------------------------Button4----------------------------------------------
                ElevatedButton(
                  onPressed: () {
                    if (optionIndex == -1) {
                      setState(() {
                        optionIndex = 3;
                      });
                    }
                  },
                  style: ButtonStyle(
                      side: const MaterialStatePropertyAll(
                          BorderSide(width: 1, color: Colors.black87)),
                      backgroundColor: getColor(3),
                      fixedSize: const MaterialStatePropertyAll(Size(220, 35))),
                  child: Text(
                    "D. ${allQuestions[questionIndex].options[3]}",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              validateNextPage();
            });
          },
          backgroundColor: const Color.fromARGB(255, 212, 82, 232),
          child: const Icon(
            Icons.forward,
            color: Colors.white,
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 212, 82, 232),
          title: const Text(
            "QuizApp ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Image.network(
                "data:image/jpeg;base64,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",
                height: 250,
                width: 250,
              ),
              const Text(
                "Quiz Score Is",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                "$correctAns / ${allQuestions.length}",
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                questionIndex = 0;
                optionIndex = -1;
                questionScreen1 = true;
                questionscreen2 = false;
                correctAns = 0;
              });
            },
            backgroundColor: const Color.fromARGB(255, 212, 82, 232),
            child: const Icon(
              Icons.reset_tv,
              color: Colors.white,
            )),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return isQuestionScreen();
  }
}
