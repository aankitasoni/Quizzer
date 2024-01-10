import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app3/constants/colors.dart';
import 'package:quiz_app3/constants/images.dart';
import 'package:quiz_app3/constants/text_style.dart';
import 'package:quiz_app3/screens/result_screen.dart';
import 'package:quiz_app3/services/api_services.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  var currentQuestionIndex = 0;
  int seconds = 60;
  Timer? timer;
  late Future quiz;

  int points = 0;

  var isLoaded = false;
  var optionsList = [];

  var optionsColor = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];

  var data; // Declare data variable

  @override
  void initState() {
    super.initState();
    quiz = getQuiz();
    startTimer();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          timer.cancel();
          moveToNextQuestion();
        }
      });
    });
  }

  resetColor() {
    optionsColor = [
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
      Colors.white,
    ];
  }

  moveToNextQuestion() {
    if (currentQuestionIndex < data.length - 1) {
      isLoaded = false;
      currentQuestionIndex++;
      resetColor();
      seconds = 60;
      startTimer();
    } else {
      // Handle quiz completion, e.g., show result or submit quiz
      timer!.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(12),
          child: FutureBuilder(
            future: quiz,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                data = snapshot.data["results"]; // Assign data variable

                if (isLoaded == false) {
                  optionsList = data[currentQuestionIndex]["incorrect_answers"];
                  optionsList.add(data[currentQuestionIndex]["correct_answer"]);
                  optionsList.shuffle();
                  isLoaded = true;
                }
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                color: lightGrey,
                                width: 2,
                              ),
                            ),
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                CupertinoIcons.xmark,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              normalText(
                                "$seconds",
                                Colors.white,
                                24,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 70,
                                  height: 70,
                                  child: CircularProgressIndicator(
                                    value: seconds / 60,
                                    valueColor: const AlwaysStoppedAnimation(
                                        Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        ideas,
                        width: 200,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: normalText(
                          "Question ${currentQuestionIndex + 1} of ${data.length}",
                          lightGrey,
                          18,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      normalText(
                        data[currentQuestionIndex]["question"],
                        Colors.white,
                        20,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: optionsList.length,
                        itemBuilder: (BuildContext context, int index) {
                          var answer =
                              data[currentQuestionIndex]["correct_answer"];

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (answer == optionsList[index].toString()) {
                                  optionsColor[index] = Colors.green;
                                  points = points + 1;
                                  print(points);
                                } else {
                                  optionsColor[index] = Colors.red;
                                }

                                // Move to the next question after a delay
                                Future.delayed(
                                  const Duration(seconds: 1),
                                  () {
                                    moveToNextQuestion();
                                  },
                                );
                              });
                            },
                            child: SingleChildScrollView(
                              child: Container(
                                // height: 1000,
                                margin: const EdgeInsets.only(bottom: 20),
                                alignment: Alignment.center,
                                width: size.width - 100,
                                padding: const EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                  color: optionsColor[index],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: headingText(
                                  optionsList[index].toString(),
                                  blue,
                                  18,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      if (currentQuestionIndex + 1 == data.length)
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ResultScreen(points: points),
                              ),
                            );
                          },
                          child: const Text('Submit'),
                        ),
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
