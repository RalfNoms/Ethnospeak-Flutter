class Quiz {
  const Quiz(this.text, this.answers, this.correctAnswer);

  final String text;              // Question text
  final List<String> answers;     // List of possible answers
  final String correctAnswer;     // Correct answer

  // Function to return a shuffled list of answers for the quiz
  List<String> getShuffledAnswers() {
    final shuffleList = List.of(answers);
    shuffleList.shuffle();
    return shuffleList;
  }
}