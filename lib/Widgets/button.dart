import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
   const CustomButton({Key? key, required this.marginNum, required this.width, required this.height, required this.onTap, required this.backgroundColor, required this.label}) : super(key: key);
final double marginNum;
final double width;
final double height;
final VoidCallback onTap;
final Color backgroundColor;
final Text label;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(marginNum),//10
      width: width,//40
      height: height, //50
      child: ElevatedButton(
          onPressed:onTap,
          style: ButtonStyle(
              backgroundColor:
              MaterialStatePropertyAll<
                  Color>(backgroundColor),
              shape: MaterialStateProperty.all<
                  RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(30),
                    //side: const BorderSide(color: Color(0xff697dec)) //borderColor
                  )
              )
          ),
          child:label,
     )
    );
  }
}
