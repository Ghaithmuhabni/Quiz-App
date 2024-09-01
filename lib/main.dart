import 'package:flutter/material.dart';
import 'quastion.dart';

void main() {
  runApp(const ExamApp());
}

class ExamApp extends StatelessWidget {
  const ExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey,
            title: const Text("Asks"),
          ),
          body: const Padding(
            padding: EdgeInsets.all(20.0),
            child: exampBody(),
          ),
        ),
      ),
    );
  }
}

class exampBody extends StatefulWidget {
  const exampBody({super.key});

  @override
  State<exampBody> createState() => _exampBodyState();
}

class _exampBodyState extends State<exampBody> {
  List<Widget> answerResult = [];
  int correctAnswers = 0;
  bool finished = false;

  List<Quastions> quastionsGroup = [
    Quastions(
        q: "The number of planets in the solar system is eight planets.",
        i: "images/image-1.jpg",
        a: true),
    Quastions(q: "Cats are carnivores.", i: "images/image-2.jpg", a: true),
    Quastions(q: "China is in Africa", i: "images/image-3.jpg", a: false),
    Quastions(
        q: "The earth is flat, not spherical.",
        i: "images/image-4.jpg",
        a: false),
    Quastions(
        q: "Humans can survive without eating meat.",
        i: "images/image-5.jpg",
        a: true),
    Quastions(
        q: "The sun revolves around the earth and the earth revolves around the moon.",
        i: "images/image-6.jpg",
        a: false),
    Quastions(q: "Animals do not feel pain", i: "images/image-7.jpg", a: false),
  ];

  int quastionNum = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: answerResult,
        ),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              if (!finished)
                Image.asset(quastionsGroup[quastionNum].quastionImage),
              const SizedBox(
                height: 10,
              ),
              if (!finished)
                Text(
                  quastionsGroup[quastionNum].quastionText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w400),
                )
              else
                Column(
                  children: [
                    Text(
                      'You have completed the quiz!',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Your score: $correctAnswers / ${quastionsGroup.length}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
            ],
          ),
        ),
        if (!finished) ...[
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)))),
              onPressed: () {
                bool correctedAnswer =
                    quastionsGroup[quastionNum].quastionAnswer;
                if (correctedAnswer == true) {
                  setState(() {
                    correctAnswers++;
                    answerResult.add(
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.thumb_up,
                          color: Colors.green,
                        ),
                      ),
                    );
                    if (quastionNum < quastionsGroup.length - 1) {
                      quastionNum++;
                    } else {
                      finished = true;
                    }
                  });
                } else {
                  setState(() {
                    answerResult.add(
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.thumb_down,
                          color: Colors.red,
                        ),
                      ),
                    );
                    if (quastionNum < quastionsGroup.length - 1) {
                      quastionNum++;
                    } else {
                      finished = true;
                    }
                  });
                }
              },
              child: const Text(
                "True",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)))),
              onPressed: () {
                bool correctedAnswer =
                    quastionsGroup[quastionNum].quastionAnswer;
                if (correctedAnswer == false) {
                  setState(() {
                    correctAnswers++;
                    answerResult.add(
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.thumb_up,
                          color: Colors.green,
                        ),
                      ),
                    );
                    if (quastionNum < quastionsGroup.length - 1) {
                      quastionNum++;
                    } else {
                      finished = true;
                    }
                  });
                } else {
                  setState(() {
                    answerResult.add(
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.thumb_down,
                          color: Colors.red,
                        ),
                      ),
                    );
                    if (quastionNum < quastionsGroup.length - 1) {
                      quastionNum++;
                    } else {
                      finished = true;
                    }
                  });
                }
              },
              child: const Text(
                "False",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ))
        ] else ...[
          Expanded(
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)))),
              onPressed: () {
                setState(() {
                  quastionNum = 0;
                  correctAnswers = 0;
                  answerResult = [];
                  finished = false;
                });
              },
              child: const Text(
                "Restart",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          )
        ],
      ],
    );
  }
}
