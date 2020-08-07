import 'package:bmicalculator/pages/analysis.dart';
import 'package:bmicalculator/widgets/buttons.dart';
import 'package:bmicalculator/widgets/cardiconcontent.dart';
import 'package:bmicalculator/widgets/customcard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import 'package:bmicalculator/calculations.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 150;
  int weight = 70;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'BMI CALCULATOR',
              style: TextStyle(
                fontFamily: 'Poppins',
              ),
            ),
            Text(
              'by Udit Singh',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w200,
                  fontSize: 11),
            )
          ],
        ),
        elevation: 0,
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
              child: Icon(Icons.info),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: BMICard(
                    pressed: () => setState(() {
                      selectedGender = Gender.male;
                    }),
                    colour: selectedGender == Gender.male
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: CardIconContent(
                      cardicon: FontAwesomeIcons.mars,
                      cardtext: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: BMICard(
                    pressed: () => setState(() {
                      selectedGender = Gender.female;
                    }),
                    colour: selectedGender == Gender.female
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: CardIconContent(
                      cardicon: FontAwesomeIcons.venus,
                      cardtext: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Expanded(
              child: BMICard(
                colour: activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: cardtextstyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: boldCardHeadings,
                        ),
                        Text(
                          'cm',
                          style: cardtextstyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderThemeData(
                          thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 15,
                            disabledThumbRadius: 10,
                          ),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30),
                          thumbColor: Colors.yellow,
                          overlayColor: Color(0x25EB1555),
                          activeTrackColor: Colors.yellow,
                          inactiveTrackColor: inactiveCardColor),
                      child: Slider(
                        onChanged: (val) {
                          setState(() {
                            height = val.toInt();
                          });
                        },
                        min: 60,
                        value: height.toDouble(),
                        max: 240,
                        // activeColor: Colors.yellow,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(1),
            child: Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: BMICard(
                      colour: activeCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: cardtextstyle,
                          ),
                          Text(
                            weight.toString(),
                            style: boldCardHeadings,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              CustomIconButton(
                                icon: FontAwesomeIcons.minus,
                                pressed: () => setState(() {
                                  weight--;
                                }),
                              ),
                              CustomIconButton(
                                icon: FontAwesomeIcons.minus,
                                pressed: () => setState(() {
                                  weight--;
                                }),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: BMICard(
                      colour: activeCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: cardtextstyle,
                          ),
                          Text(
                            age.toString(),
                            style: boldCardHeadings,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              CustomIconButton(
                                icon: FontAwesomeIcons.minus,
                                pressed: () => setState(() {
                                  age--;
                                }),
                              ),
                              CustomIconButton(
                                icon: FontAwesomeIcons.plus,
                                pressed: () => setState(() {
                                  age++;
                                }),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MaterialButton(
                    child: Text(
                      'CALCULATE BMI',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w300),
                    ),
                    onPressed: () {
                      Calculations calc =
                          Calculations(height: height, weight: weight);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AnalysisPage(
                                    bmiValue: calc.calculateBMI(),
                                    bmiComment: calc.getResult(),
                                  )));
                    },
                    color: Colors.pink[600],
                    height: MediaQuery.of(context).size.height * 0.095,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
