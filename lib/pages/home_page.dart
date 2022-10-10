import 'package:flutter/material.dart';
import 'package:quiz_app/Widgets/answers.dart';
import 'package:quiz_app/Widgets/result.dart';

import 'package:quiz_app/model.dart';

import '../Widgets/background.dart';
import '../Widgets/button.dart';
import '../Widgets/circular_avatar.dart';
import '../constants/constants.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
//add score to right and false answers
List score = [];
//index of List<Quizzes>
int index = 0;
//color of selected answer
Color color=Colors.white;
//to distinguish selected button
int  selectedIndex=0;
//check if question is answered ( a button is tapped )
bool answered=false;
class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: customColor,
        leading: IconButton(
          icon:index==0?const SizedBox() :const Icon(Icons.arrow_back),onPressed:returnBack ,),
          title: Center(
            child: CircularAvatar( index: index, list: list, foregroundColor: whiteColor,
                  backgroundColor: endColor,),
          ),

        centerTitle: true,
      ),
      body: Stack(
          children: [
            const GradientContainer(endColor: endColor,beginColor: beginColor,),
      Column(
        children: [
          Expanded(
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 20,
                  bottom: 20,
                ),
                width: 500,
                height: 500,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: index != list.length
                    ? Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            child: Text("${list[index].question} ?",
                                style: textStyle),
                          ),
                          Answers(index: index, list: list, onTap: answered?(){}:checkAnswer,
                            answered: answered, selectedIndex: selectedIndex, color: color,
                          ),
                          const SizedBox(height: 20,),
                          CustomButton(onTap: next,color: endColor),
                        ],
                      )
                    : Result(quizList: list, color: customColor,),
              ),
            ),
          ),

        ],
      ),
          ],
        ),

    );

  }
  void checkAnswer(int i){
    setState(
          ()  {
            answered=true;
            selectedIndex=i;
        if (list[index].answersDetails[i].isTrue == true) {
          score.add(1);
          color=Colors.green;
        }
        else{
          score.add(0);
          color=Colors.red;
        }
      },
    );
  }
 void returnBack(){
    setState(
          ()  {
            if(answered==true) {
         score.removeLast();
            }
            answered=false;
            score.removeLast();
        index--;
      },
    );
  }
  void next(){
    setState(() {
      if(answered) {
        answered = false;
        index++;
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: const Text("select an answer to continue"),backgroundColor: customColor,),
        );
      }
    });
  }
}
