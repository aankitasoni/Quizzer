import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app3/constants/colors.dart';
import 'package:quiz_app3/constants/images.dart';
import 'package:quiz_app3/constants/text_style.dart';
import 'package:quiz_app3/screens/quiz_screen.dart';
import 'package:quiz_app3/widgets/back_button.dart';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              backButton(onPressed: (){
                Navigator.pop(context);
              }),
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
