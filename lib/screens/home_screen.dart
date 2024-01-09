import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app3/constants/colors.dart';
import 'package:quiz_app3/constants/images.dart';
import 'package:quiz_app3/constants/text_style.dart';
import 'package:quiz_app3/screens/quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.xmark,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
              Image.asset(
                balloon2,
                // width: 250,
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  normalText(
                    "Welcome to ",
                    lightGrey,
                    28,
                  ),
                  // const SizedBox(width: 5,),
                  headingText("Quizzer", Colors.white, 32),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              normalText(
                  "Do you feel confident? Here you'll face our most difficult questions!",
                  lightGrey,
                  16),
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const QuizScreen(),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    alignment: Alignment.center,
                    width: size.width - 100,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: headingText(
                      "Continue",
                      blue,
                      18,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
