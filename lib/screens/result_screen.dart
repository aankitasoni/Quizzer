import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quiz_app3/constants/text_style.dart';
import 'package:quiz_app3/screens/home_screen.dart';
import 'package:quiz_app3/widgets/custom_button.dart';

import '../constants/colors.dart';

class ResultScreen extends StatefulWidget {
  final int points;

  const ResultScreen({
    super.key,
    required this.points,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Results"),
          centerTitle: true,
          leading: InkWell(
            child: const Icon(
              CupertinoIcons.xmark,
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  headingText("Your Final Score", Colors.white, 28),
                  const SizedBox(
                    height: 50,
                  ),
                  CircularPercentIndicator(
                    radius: 100.0,
                    lineWidth: 10.0,
                    percent: (widget.points.toDouble()) / 100,
                    center: Text(
                      "${widget.points}/20",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    backgroundColor: lightGrey,
                    progressColor: Colors.green,
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Text(
                    "Correct Answer: ${widget.points}",
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Incorrect Answer: ${20 - widget.points}",
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomButton(
                    buttonText: "Try Another",
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
