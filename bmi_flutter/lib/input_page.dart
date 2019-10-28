import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'IconContent.dart';
import 'ReusableCard.dart';
import 'contants.dart';
import 'results_page.dart';
import 'CalculateBrain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReuseableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? ActiveColor
                        : InActiveColor,
                    cardChild: IconContent(
                      myIcon: FontAwesomeIcons.mars,
                      myContent: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? ActiveColor
                        : InActiveColor,
                    cardChild: IconContent(
                      myIcon: FontAwesomeIcons.venus,
                      myContent: 'FEMALE',
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReuseableCard(
              colour: ActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('HEIGHT'),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: labelnumberStyle,
                      ),
                      Text(
                        'cm',
                      ),
                    ],
                  ),
                  SliderTheme(
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                      data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 18.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 28.0),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        inactiveTrackColor: Color(0xFF8E8D98),
                      ))
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReuseableCard(
                    colour: ActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('WEIGHT'),
                        Text(
                          weight.toString(),
                          style: labelnumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundedIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    colour: ActiveColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE'),
                        Text(
                          age.toString(),
                          style: labelnumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundedIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculateBrain calc =
                  CalculateBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    result: calc.calculateBmi(),
                    resultText: calc.getResult(),
                    resultInter: calc.getInterpretation(),
                  ),
                ),
              );
            },
            child: Container(
              color: BottomColor,
              margin: EdgeInsets.only(top: 10.0),
              height: BottomHeight,
              width: double.infinity,
              child: Center(
                child: Text(
                  'Calculate',
                  style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  RoundedIconButton({this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: Color(0xFF4C4F5E),
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      child: Icon(icon),
    );
  }
}
