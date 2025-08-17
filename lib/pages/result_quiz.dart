import 'package:capstone_project/pages/Data_services/questionaires.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final List<String> selectedAnswers;

  const Result({super.key, required this.selectedAnswers});

  @override
  Widget build(BuildContext context) {
    // Initialize the score to 0
    int score = 0;
    int answeredQuestionsCount = 0; // Keep track of how many questions the user answered

    // Calculate the score by iterating over the selected answers
    for (int i = 0; i < questionaire.length; i++) {
      // Check if the user answered the question
      if (i < selectedAnswers.length && selectedAnswers[i].isNotEmpty) {
        answeredQuestionsCount++; // Increment answered question count

        // If answered and correct, increment the score
        if (selectedAnswers[i] == questionaire[i].correctAnswer) {
          score++; // Increment score if the answer is correct
        }
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xFFDCD0D0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Quiz Results', style: TextStyle(color: Colors.black),),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Your Answers:",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: questionaire.length,
                  itemBuilder: (context, index) {
                    final question = questionaire[index];

                    // Check if the user answered the question or not
                    final bool answered = index < selectedAnswers.length && selectedAnswers[index].isNotEmpty;
                    final selectedAnswer = answered ? selectedAnswers[index] : "No Answer";
                    // Check if the selected answer matches the correct answer
                    final isCorrect = answered && selectedAnswer == question.correctAnswer;

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${index + 1}. ${question.text}",
                            style: const TextStyle(color: Colors.black, fontSize: 18),
                          ),
                          const SizedBox(height: 10),

                          // Display the user's answer (or "No Answer" if unanswered)
                          Text(
                            "Your Answer: $selectedAnswer",
                            style: TextStyle(
                              fontSize: 18,
                              color: isCorrect
                                  ? Colors.green
                                  : (answered ? Colors.red : Colors.orange),
                            ),
                          ),

                          // Display the correct answer if the user's answer was wrong or if they did not answer
                          if (!isCorrect)
                            Text(
                              "Correct Answer: ${question.correctAnswer}",
                              style: const TextStyle(color: Colors.green, fontSize: 18),
                            ),
                          const Divider(
                            color: Colors.black,
                            thickness: 1,
                            height: 20,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: Text(
                  // Display the score based only on answered questions
                  "Your Score: $score/$answeredQuestionsCount", // Show the correct score in format X/Y
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                  height: 50,
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate back to the Activity screen
                      Navigator.popUntil(context, ModalRoute.withName('/Activity'));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black.withOpacity(0.1),
                    ),
                    child: const Text(
                      'Go Back',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


