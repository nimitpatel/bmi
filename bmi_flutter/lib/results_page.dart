import 'package:bmi_calculator/contants.dart';
import 'package:flutter/material.dart';
import 'ReusableCard.dart';

class ResultsPage extends StatelessWidget {

  final String resultText;
  final String result;
  final String resultInter;

  ResultsPage({this.result,this.resultInter,this.resultText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Results',
                style: labelnumberStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReuseableCard(
              colour: ActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    resultText,
                    style: TextStyle(
                        color: Colors.yellow[300],
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    result,
                    style: TextStyle(
                      fontSize: 100.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    resultInter,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                color: BottomColor,
                height: BottomHeight,
                child: Center(
                  child: Text(
                    'Re-Calculate',
                    style:
                        TextStyle(fontSize: 40.0, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
