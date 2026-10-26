import 'package:flutter/material.dart';
import 'package:bmi/bottom_button.dart';
import 'package:bmi/calculator.dart';
import 'package:bmi/constants.dart';
import 'package:bmi/custom_card.dart';
import 'package:bmi/icon.dart';
import 'package:bmi/round_icon_button.dart';

import 'result_page.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // Nilai awal dapat diubah melalui kartu gender, slider, serta tombol +/-.
  Gender selectedGender = Gender.male;
  int height = 160;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMR CALCULATOR')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 150.0,
                child: Row(
                  children: [
                    Expanded(
                      child: CustomCard(
                        color: selectedGender == Gender.male
                            ? activeCardColor
                            : inactiveCardColor,
                        cardChild: IconCard(
                          cardIcon: Icons.male,
                          caption: 'MALE',
                        ),
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: CustomCard(
                        color: selectedGender == Gender.female
                            ? activeCardColor
                            : inactiveCardColor,
                        cardChild: IconCard(
                          cardIcon: Icons.female,
                          caption: 'FEMALE',
                        ),
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 190.0,
                child: CustomCard(
                  color: activeCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('HEIGHT', style: labelTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(height.toString(), style: numberTextStyle),
                          const Text('cm', style: labelTextStyle),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: const Color(0xFF8D8E98),
                          thumbColor: const Color(0xFFEB1555),
                          overlayColor: const Color(0x29EB1555),
                          thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 15.0,
                          ),
                          overlayShape: const RoundSliderOverlayShape(
                            overlayRadius: 30.0,
                          ),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double value) {
                            setState(() {
                              height = value.round();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 190.0,
                child: Row(
                  children: [
                    Expanded(
                      child: CustomCard(
                        color: activeCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('WEIGHT (kg)', style: labelTextStyle),
                            Text(weight.toString(), style: numberTextStyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: Icons.remove,
                                  onPressed: () {
                                    setState(() {
                                      if (weight > 1) {
                                        weight--;
                                      }
                                    });
                                  },
                                ),
                                const SizedBox(width: 10.0),
                                RoundIconButton(
                                  icon: Icons.add,
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
                      child: CustomCard(
                        color: activeCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('AGE (years)', style: labelTextStyle),
                            Text(age.toString(), style: numberTextStyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: Icons.remove,
                                  onPressed: () {
                                    setState(() {
                                      if (age > 1) age--;
                                    });
                                  },
                                ),
                                const SizedBox(width: 10.0),
                                RoundIconButton(
                                  icon: Icons.add,
                                  onPressed: () {
                                    setState(() {
                                      if (age < 120) age++;
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
              BottomButton(
                buttonTitle: 'CALCULATE',
                onTap: () {
                  // Data dari kontrol input dihitung, lalu dikirim ke halaman hasil.
                  final calculator = BmrCalculator(
                    height: height,
                    weight: weight,
                    age: age,
                    gender: selectedGender,
                  );
                  final bmr = calculator.calculateBMR().round().toString();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(bmr: bmr),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
