import 'package:flutter/material.dart';
import 'contants.dart';

class IconContent extends StatelessWidget {
  final IconData myIcon;
  final String myContent;

  IconContent({this.myIcon, this.myContent});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          myIcon,
          color: Color(0xFFFFFFFF),
          size: 80.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          myContent,
          style: labelTextStyle,
        )
      ],
    );
  }
}
