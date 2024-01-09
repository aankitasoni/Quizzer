import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app3/constants/text_style.dart';

import '../constants/colors.dart';
import '../constants/images.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  int seconds = 60;
  Timer? timer;

  var currentQuestionIndex = 0;

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          timer.cancel();
        }
      });
    });
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
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [blue, darkBlue],
            ),
          ),
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
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: CircularProgressIndicator(
                          value: seconds / 60,
                          valueColor:
                          const AlwaysStoppedAnimation(Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: lightGrey,
                        width: 2,
                      ),
                    ),
                    child: TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.heart_fill,
                        color: Colors.white,
                        size: 18,
                      ),
                      label: normalText(
                        "Like",
                        Colors.white,
                        14,
                      ),
                    ),
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
                  "Question ${currentQuestionIndex + 1} of 40",
                  lightGrey,
                  18,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              normalText(
                "what is name of this channel",
                Colors.white,
                20,
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
                  itemBuilder: (BuildContext context, int index){
                return Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  alignment: Alignment.center,
                  width: size.width - 100,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: headingText(
                    "Ankita",
                    blue,
                    18,
                  ),
                );
              },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
