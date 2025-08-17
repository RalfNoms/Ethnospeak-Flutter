import 'package:capstone_project/pages/questions.dart';
import 'package:capstone_project/pages/result_quiz.dart';  // Make sure result_quiz.dart is valid
import 'package:flutter/material.dart';

class Activity extends StatefulWidget {
  const Activity({super.key});

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  List<String> selectedAnswers = [];

  void chooseAnswer(String answer) {
    // Adds selected answer to the list
    setState(() {
      selectedAnswers.add(answer);
    });
  }

  void finishQuiz() {
    // Navigate to Result screen when quiz is complete
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Result(
          selectedAnswers: selectedAnswers,
        ),
      ),
    ).then((_) {
      // Reset the answers when returning to the Activity screen
      setState(() {
        selectedAnswers = [];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDCD0D0),
      appBar: AppBar(
         backgroundColor: Colors.transparent,
        title: Text("Activity"),
          leading:  IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
          ),
      ),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 75,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  // Ensure answers are cleared before starting a new quiz
                  selectedAnswers = [];

                  // Navigate to the Questions screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Questions(
                        onSelectedAnswer: chooseAnswer,
                        onFinishQuiz: finishQuiz,  // Callback for finishing the quiz
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.1),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(13)),
                  ),
                ),
                child: const Text(
                  "Quiz Translation Word of Bagobo Klata",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}







