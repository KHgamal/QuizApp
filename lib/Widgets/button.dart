import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   const CustomButton({Key? key, required this.onTap,
     required this.color}) : super(key: key);
final VoidCallback onTap;
final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      width: 100,
      height: 50,
      child: ElevatedButton(
          onPressed:onTap,
          style: ButtonStyle(
              backgroundColor:
              MaterialStatePropertyAll<
                  Color>(color),
              shape: MaterialStateProperty.all<
                  RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(30),
                  )
              )
          ),
          child:const Text("Next"),
     )
     
    );
  }
}
