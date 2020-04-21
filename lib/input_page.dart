import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:bmi_calculator/reuseable_card.dart';
import 'package:bmi_calculator/icon_content.dart';
import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/round_icon_button.dart';
import 'package:bmi_calculator/results_page.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 30;

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
                  _buildMaleCard(),
                  _buildFemaleCard(),
                ],
              ),
            ),
            _buildHeightCard(context),
            Expanded(
              child: Row(
                children: <Widget>[
                  _buildWeightCard(),
                  _buildAgeCard(),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResultsPage()),
                );
              },
              child: Container(
                child: Text('CALCULATE'),
                color: kBottomContainerColor,
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: kBottomContainerHeight,
              ),
            )
          ],
        ));
  }

  Expanded _buildAgeCard() {
    return Expanded(
      child: ReusableCard(
        colour: kActiveCardColor,
        cardChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'AGE',
              style: kLabelTextStyle,
            ),
            Text(
              '$age',
              style: kNumberTextStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RoundIconButton(
                  onPress: () {
                    setState(() {
                      age = age < 200 ? ++age : age;
                    });
                  },
                  icon: FontAwesomeIcons.plus,
                ),
                SizedBox(width: 10),
                RoundIconButton(
                  onPress: () {
                    setState(() {
                      age = age > 0 ? --age : age;
                    });
                  },
                  icon: FontAwesomeIcons.minus,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Expanded _buildWeightCard() {
    return Expanded(
      child: ReusableCard(
        colour: kActiveCardColor,
        cardChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'WEIGHT',
              style: kLabelTextStyle,
            ),
            Text(
              '$weight',
              style: kNumberTextStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RoundIconButton(
                  onPress: () {
                    setState(() {
                      weight = weight < 400 ? ++weight : weight;
                    });
                  },
                  icon: FontAwesomeIcons.plus,
                ),
                SizedBox(width: 10),
                RoundIconButton(
                  onPress: () {
                    setState(() {
                      weight = weight > 0 ? --weight : weight;
                    });
                  },
                  icon: FontAwesomeIcons.minus,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Expanded _buildHeightCard(BuildContext context) {
    return Expanded(
      child: ReusableCard(
        colour: kActiveCardColor,
        cardChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'HEIGHT',
              style: kLabelTextStyle,
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Text(
                  '$height',
                  style: kNumberTextStyle,
                ),
                Text(
                  'cm',
                  style: kLabelTextStyle,
                ),
              ],
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                inactiveTrackColor: Color(0xFF8D8E98),
                activeTrackColor: Colors.white,
                thumbColor: Color(0xFFEB1555),
                overlayColor: Color(0x29EB1555),
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
              ),
              child: Slider(
                value: height.toDouble(),
                min: 120.0,
                max: 220.0,
                onChanged: (newValue) {
                  setState(() {
                    height = newValue.round();
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded _buildFemaleCard() {
    return Expanded(
      child: ReusableCard(
        onPress: () {
          setState(() {
            selectedGender = Gender.female;
          });
        },
        colour: selectedGender == Gender.female
            ? kActiveCardColor
            : kInactiveCardColor,
        cardChild: IconContent(
          icon: FontAwesomeIcons.venus,
          label: 'FEMALE',
        ),
      ),
    );
  }

  Expanded _buildMaleCard() {
    return Expanded(
      child: ReusableCard(
        onPress: () {
          setState(() {
            selectedGender = Gender.male;
          });
        },
        colour: selectedGender == Gender.male
            ? kActiveCardColor
            : kInactiveCardColor,
        cardChild: IconContent(
          icon: FontAwesomeIcons.mars,
          label: 'MALE',
        ),
      ),
    );
  }
}
