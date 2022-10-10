class Quizzes{
  final String question;
  final  List<AnswersDetails> answersDetails;
  Quizzes({required this.question,required this.answersDetails});
}

class AnswersDetails{
  final String text;
  final bool isTrue;

  AnswersDetails(this.text, this.isTrue);

}

List<Quizzes> list = [
  Quizzes(question: "what is the capital of India ", answersDetails: [
    AnswersDetails("mumbai", true),
    AnswersDetails("sydney", false),
    AnswersDetails("bali", false),
  ]
  ),
  Quizzes(question: "what is the capital of Australia ", answersDetails: [
    AnswersDetails("mumbai", false),
    AnswersDetails("sydney", true),
    AnswersDetails("bali", false),
  ]),
  Quizzes(question: "what is the capital of Indonesia ", answersDetails: [
    AnswersDetails("mumbai", false),
    AnswersDetails("sydney", false),
    AnswersDetails("bali", true),
  ]),
];
