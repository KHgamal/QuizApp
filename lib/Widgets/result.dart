import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../pages/home_page.dart';
class Result extends StatelessWidget {
   Result({Key? key, required this.quizList, required this.color}) : super(key: key);
final List quizList;
final Color color;
 int nOfRightAnswers=score.reduce((value, element) => value + element);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Result",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40),) ,
         Padding(
           padding: const EdgeInsets.all(20),
           child: CircularPercentIndicator(
            radius: 100,
            lineWidth: 13.0,
            animation: true,
            percent: nOfRightAnswers/quizList.length,
            center: Text(" $nOfRightAnswers / ${quizList.length}",
              style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 40),
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor:color ,
        ),
         ),
        Text(
 "you got ${((nOfRightAnswers/quizList.length)*100).floor()}% of the answers correct ",
    style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
       const Center(
          child: Text(
            "congratulations!",
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
        )
      ],
    );
  }
}
