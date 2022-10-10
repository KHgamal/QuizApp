import 'package:flutter/material.dart';
class CircularAvatar extends StatelessWidget {
  const CircularAvatar({Key? key, required this.index, required this.list, required this.foregroundColor, required this.backgroundColor}) : super(key: key);
final int index;
final List list;
final Color foregroundColor;
final Color  backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 30,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (context, item) => CircleAvatar(
            radius: 20,
              foregroundColor: foregroundColor,
              backgroundColor: backgroundColor,
              child: item >= index
                  ? Text("${item + 1}")
                  : const Icon(Icons.done))),
    );
  }
}
