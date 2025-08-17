import 'dart:async';  // Import the timer package

import 'package:capstone_project/pages/Data_services/questionaires.dart';
import 'package:flutter/material.dart';

class Questions extends StatefulWidget {
  const Questions({
    super.key,
    required this.onSelectedAnswer,
    required this.onFinishQuiz,
  });

  final void Function(String) onSelectedAnswer;
  final VoidCallback onFinishQuiz;

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  int currentQuestionIndex = 0;
  late int maxQuestions;  // Ensure this matches the number of questions available in your quiz
  List<String> selectedAnswers = [];
  Timer? questionTimer;  // Timer for each question
  int remainingTime = 20;  // 20 seconds for each question

  @override
  void initState() {
    super.initState();
    maxQuestions = questionaire.length;  // Dynamically set maxQuestions to match the length of the question list
    startTimer(); // Start the timer for the first question
  }

  @override
  void dispose() {
    // Dispose of the timer when the widget is destroyed
    questionTimer?.cancel();
    super.dispose();
  }

  void startTimer() {
    remainingTime = 20;  // Reset the timer for each question
    questionTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingTime > 0) {
          remainingTime--;  // Decrease the remaining time
        } else {
          // Time's up! Proceed to the next question
          proceedToNextQuestion();
        }
      });
    });
  }

  void proceedToNextQuestion() {
    questionTimer?.cancel();  // Cancel the current timer

    // If the question wasn't answered, add "No Answer" to selectedAnswers
    if (selectedAnswers.length <= currentQuestionIndex) {
      selectedAnswers.add("No Answer");
      widget.onSelectedAnswer("No Answer"); // Mark unanswered questions
    }

    setState(() {
      if (currentQuestionIndex < maxQuestions - 1) {
        currentQuestionIndex++;
        startTimer();  // Start the timer for the next question
      } else {
        // All questions answered, finish the quiz
        widget.onFinishQuiz();
      }
    });
  }

  void answerQuestion(String selectedAnswer) {
    // Add selected answer to the list
    if (selectedAnswers.length > currentQuestionIndex) {
      selectedAnswers[currentQuestionIndex] = selectedAnswer;
    } else {
      selectedAnswers.add(selectedAnswer);
    }

    widget.onSelectedAnswer(selectedAnswer);
    proceedToNextQuestion();  // Proceed to the next question after answering
  }

  @override
  Widget build(BuildContext context) {
    if (currentQuestionIndex >= maxQuestions) {
      return const Center(
        child: Text(
          "No more questions available.",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      );
    }

    // Retrieve the current question from your quiz model
    final currentQuestion = questionaire[currentQuestionIndex];

    return Scaffold(
      backgroundColor: const Color(0xFFDCD0D0),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Time left: $remainingTime seconds',
                  style: const TextStyle(
                    color: Colors.redAccent,
                    fontSize: 18,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Display the current question index
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Question ${currentQuestionIndex + 1}/$maxQuestions',  // Add 1 since index starts at 0
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

                      const Divider(
                            color: Colors.black,
                            thickness: 1,
                            height: 20,
                          ),  
             //Current Question above on the answer button
              Align(
                alignment: Alignment.center,
                child: Text(
                  currentQuestion.text,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Display the answer options with spacing between them
              ...currentQuestion.answers.map((answer) {
                return Column(
                  children: [
                    SizedBox(
                      height: 60,
                      width: 350,
                      child: ElevatedButton(
                        
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFD3C4C4).withOpacity(0.1),
                        ),
                        onPressed: () => answerQuestion(answer),
                        child: Text(
                          answer,
                          style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15), // Space between buttons
                  ],
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}






