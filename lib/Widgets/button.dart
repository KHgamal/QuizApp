import 'package:flutter/material.dart';

import '../constants/constants.dart';
class CustomButton extends StatelessWidget {
   const CustomButton({Key? key, required this.onTap,
     required this.label}) : super(key: key);
final VoidCallback onTap;
final Text label;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      width: 40,
      height: 50,
      child: ElevatedButton(
          onPressed:onTap,
          style: ButtonStyle(
              backgroundColor:
              MaterialStatePropertyAll<
                  Color>(customColor),
              shape: MaterialStateProperty.all<
                  RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(30),
                  )
              )
          ),
          child:label,
     )
    );
  }
}
