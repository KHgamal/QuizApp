import 'package:flutter/material.dart';

import '../constants/constants.dart';

class Answers extends StatelessWidget {
  const Answers({Key? key, required this.index, required this.list, required this.onTap, required this.answered, required this.selectedIndex, required this.color}) : super(key: key);
  final int index;
  final List list;
  final dynamic onTap;
  final bool answered;
  final int selectedIndex;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: list[index].answersDetails.length,
        itemBuilder: (context, i) =>Container(
            margin: const EdgeInsets.all(15),
            width: 40,
            height: 50,
            child: ElevatedButton(
              onPressed:()=>answered?(){}:onTap(i),
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStatePropertyAll<
                      Color>(answered? (selectedIndex==i ?color :customColor):customColor,
                      ),
                  shape: MaterialStateProperty.all<
                      RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(30),
                      )
                  )
              ),
              child:Text(list[index].answersDetails[i].text),
            )
        ),

    );
  }
}
