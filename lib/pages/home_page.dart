import 'package:flutter/material.dart';
import 'package:quiz_app/Widgets/button.dart';
import 'package:quiz_app/model.dart';

import '../constants.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int score = 0;
  int index = 0;
  List<Quizzes> list = [
    Quizzes(question: "what is the capital of India ", answers: [
      {'text': "mumbai", 'isTrue': true},
      {'text': "sydney", 'isTrue': false},
      {'text': "bali", 'isTrue': false}
    ]),
    Quizzes(question: "what is the capital of Australia ", answers: [
      {'text': "mumbai", 'isTrue': false},
      {'text': "sydney", 'isTrue': true},
      {'text': "bali", 'isTrue': false}
    ]),
    Quizzes(question: "what is the capital of Indonesia ", answers: [
      {'text': "mumbai", 'isTrue': false},
      {'text': "sydney", 'isTrue': false},
      {'text': "bali", 'isTrue': true}
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                end: Alignment.topLeft,
                begin: Alignment.bottomRight,
                colors: [
                  endColor,
                  beginColor,
                ],
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: list.length,
                    itemBuilder: (context, item) => Center(
                          child: CircleAvatar(
                              radius: 25,
                              foregroundColor: whiteColor,
                              backgroundColor: customColor,
                              child: item >= index
                                  ? Text("${item + 1}")
                                  : const Icon(Icons.done)),
                        )),
              ),
              Expanded(
                flex: 20,
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
                              const SizedBox(
                                height: 20,
                              ),
                              Text("${list[index].question} ?",
                                  style: textStyle),
                              const SizedBox(
                                height: 30,
                              ),
                              ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: list[index].answers.length,
                                itemBuilder: (context, i) => 
                                    CustomButton(marginNum: 10,onTap:()=>checkAnswer(i),
                                        width: 40, height: 50,
                                        backgroundColor: customColor, 
                                        label: Text("${list[index].answers[i]["text"]}"),)
                              )
                            ],
                          )
                        : Center(
                            child: Text(
                              "your score is $score ",
                              style:textStyle ,
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
    );

  }
  void checkAnswer(int i){
    setState(
          () {
        if (list[index].answers[i]
        ["isTrue"] ==
            true) {
          score += 10;
        }
        index++;
      },
    );
  }
}
