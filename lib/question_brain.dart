import 'question.dart';

class QuestionBrain {

  int            _qNbr = 0;

  List<Question> _questions = [
    Question('Bill Gates is the founder of Microsoft.', true),
    Question('Tea has more caffeine than soda and coffee.', false),
    Question('Alcoholic beverages are divided into three classes.', true),
    Question(
        'Albert Einstein failed every subject in school that wasn\'t math or physics.',
        true),
    Question('The Leaning Tower of Pisa located in Spain.', false),
    Question('Xylophone is a stereo phone.', false),
    Question('Day after Christmas commonly known as Boxing day.', true),
    Question(
        'Metropolis is the name the fictional city Batman calls home.', false),
    Question('William Shakespeare wrote Hamlet.', true),
    Question('The World War II ended in 1945.', true),
    Question('Ottawa is the capital of Canada.', true),
    Question('supernova is an intense lightning storm.', false),
    Question('granite is harder than diamond.', false),
    Question('Some cats are actually allergic to humans.', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, if you die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
// max index: 25
  ];

  bool      isSafeNext() {
    if (_qNbr < _questions.length - 1)
      return true;
    return false;
  }

  void    reset() => _qNbr = 0;

  void    nextQuestion() => _qNbr++;

  bool    getQuestionAnswer() => _questions[_qNbr].answer;

  String  getQuestionText() => _questions[_qNbr].text;

}
