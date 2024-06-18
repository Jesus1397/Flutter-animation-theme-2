import 'dart:async';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:myapp/providers/theme_provider.dart';
import 'package:myapp/widgets/day_widget.dart';
import 'package:myapp/widgets/item_task.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  bool isThemeDark = false;

  late AnimationController _animationController1;
  late AnimationController _animationController2;
  late Animation<double> _animPart1;
  late Animation<double> _animPart2;
  late Animation<double> _animPart3;
  late Animation<double> _animPart1Neg;
  late Animation<double> _animPart2Neg;
  late Animation<double> _animPart3Neg;
  late Animation<double> _animOpacity1;
  late Animation<double> _animOpacity2;
  late Animation<double> _animOpacity3;
  late Animation<double> _animOpacityNeg1;
  late Animation<double> _animOpacityNeg2;
  late Animation<double> _animOpacityNeg3;
  late Animation<double> _animPart3LTR;

  @override
  void initState() {
    super.initState();

    _animationController1 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _animationController2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _animOpacity1 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController1,
        curve: const Interval(0.0, 0.30, curve: Curves.linear),
      ),
    );

    _animOpacity2 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController1,
        curve: const Interval(0.30, 0.50, curve: Curves.linear),
      ),
    );

    _animOpacity3 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController1,
        curve: const Interval(0.70, 1.0, curve: Curves.linear),
      ),
    );

    _animOpacityNeg1 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController2,
        curve: const Interval(0.0, 0.30, curve: Curves.linear),
      ),
    );

    _animOpacityNeg2 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController2,
        curve: const Interval(0.30, 0.60, curve: Curves.linear),
      ),
    );

    _animOpacityNeg3 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController2,
        curve: const Interval(0.60, 1.0, curve: Curves.linear),
      ),
    );

    _animPart1 = Tween(begin: 30.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController1,
        curve: const Interval(0.0, 0.30, curve: Curves.linear),
      ),
    );

    _animPart2 = Tween(begin: 30.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController1,
        curve: const Interval(0.30, 0.60, curve: Curves.linear),
      ),
    );

    _animPart3 = Tween(begin: 20.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController1,
        curve: const Interval(0.60, 1.0, curve: Curves.linear),
      ),
    );

    _animPart3LTR = Tween(begin: -40.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController1,
        curve: const Interval(0.30, 1.0, curve: Curves.linear),
      ),
    );

    _animPart1Neg = Tween(begin: 0.0, end: 40.0).animate(
      CurvedAnimation(
        parent: _animationController2,
        curve: const Interval(0.0, 0.30, curve: Curves.linear),
      ),
    );

    _animPart2Neg = Tween(begin: 0.0, end: 30.0).animate(
      CurvedAnimation(
        parent: _animationController2,
        curve: const Interval(0.30, 0.60, curve: Curves.linear),
      ),
    );

    _animPart3Neg = Tween(begin: 0.0, end: 20.0).animate(
      CurvedAnimation(
        parent: _animationController2,
        curve: const Interval(0.60, 1.00, curve: Curves.linear),
      ),
    );

    _animationController1.forward();
  }

  bool positive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          isThemeDark ? const Color(0xff2C2C2C) : const Color(0xffEAEAEA),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: AnimatedBuilder(
              animation: _animationController1,
              builder: (BuildContext context, Widget? child) {
                return AnimatedBuilder(
                  animation: _animationController2,
                  builder: (BuildContext context, Widget? child) {
                    _animationController1.addStatusListener((status) {
                      if (status == AnimationStatus.completed) {}
                    });
                    _animationController2.addStatusListener((status) {
                      if (status == AnimationStatus.completed) {
                        _animationController1.reset();
                        _animationController2.reset();
                      }
                    });
                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          Transform.translate(
                            offset: Offset(
                                0.0, _animPart1.value + _animPart1Neg.value),
                            child: Opacity(
                              opacity: (_animOpacity1.value) -
                                  (_animOpacityNeg1.value),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Hi John',
                                          style: TextStyle(
                                            color: isThemeDark
                                                ? const Color(0xffC0CAD0)
                                                : const Color(0xff545454),
                                            fontSize: 24,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const Text(
                                          'Your tasks for the day',
                                          style: TextStyle(
                                            color: Color(0xffBEC9CF),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 20),
                                    child: AnimatedToggleSwitch<bool>.dual(
                                      current: positive,
                                      first: false,
                                      second: true,
                                      spacing: 3,
                                      indicatorSize: const Size.fromWidth(28.0),
                                      style: ToggleStyle(
                                        borderColor: positive
                                            ? const Color.fromRGBO(
                                                63, 63, 63, 0.74)
                                            : const Color.fromARGB(
                                                186, 206, 206, 206),
                                      ),
                                      borderWidth: 1.0,
                                      height: 28,
                                      onChanged: (b) {
                                        setState(() {
                                          isThemeDark = !isThemeDark;
                                          positive = b;
                                          if (isThemeDark) {
                                            Provider.of<ThemeProvider>(context,
                                                    listen: false)
                                                .setTheme = ThemeData.dark();
                                          } else {
                                            Provider.of<ThemeProvider>(context,
                                                    listen: false)
                                                .setTheme = ThemeData.light();
                                          }

                                          Timer(const Duration(seconds: 2), () {
                                            _animationController1
                                                .reverse()
                                                .whenComplete(() =>
                                                    _animationController1
                                                        .forward());
                                          });
                                        });
                                      },
                                      styleBuilder: (b) => ToggleStyle(
                                        indicatorBoxShadow: [
                                          const BoxShadow(
                                            color: Colors.black26,
                                            spreadRadius: 1,
                                            blurRadius: 2,
                                            offset: Offset(0, 0),
                                          ),
                                        ],
                                        backgroundColor: b
                                            ? const Color.fromARGB(
                                                255, 39, 39, 39)
                                            : const Color.fromARGB(
                                                255, 240, 240, 240),
                                        indicatorColor: b
                                            ? const Color.fromARGB(
                                                255, 29, 29, 29)
                                            : const Color.fromARGB(
                                                255, 255, 255, 255),
                                      ),
                                      iconBuilder: (value) => value
                                          ? const Icon(
                                              Icons.nights_stay,
                                              size: 18,
                                            )
                                          : const Icon(
                                              Icons.sunny,
                                              color: Colors.yellow,
                                              size: 18,
                                            ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 100,
                            child: ListView.builder(
                              padding: const EdgeInsets.only(
                                  left: 20, bottom: 20, top: 20),
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemCount: 7,
                              itemBuilder: (
                                BuildContext context,
                                int index,
                              ) {
                                return Opacity(
                                  opacity: (_animOpacity1.value) -
                                      (_animOpacityNeg1.value),
                                  child: Transform.translate(
                                    offset: Offset(
                                      0.0,
                                      ((_animPart1.value * index) +
                                          (_animPart1Neg.value * index)),
                                    ),
                                    child: DayWidget(
                                      index: index + 1,
                                      isThemeDark: isThemeDark,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 5),
                          Transform.translate(
                            offset: Offset(
                                0.0, _animPart2.value + _animPart2Neg.value),
                            child: Opacity(
                              opacity: (_animOpacity2.value) -
                                  (_animOpacityNeg2.value),
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                decoration: BoxDecoration(
                                  color: const Color(0xffF8787B),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: isThemeDark
                                      ? [
                                          BoxShadow(
                                            color: const Color(0xffF8787B)
                                                .withOpacity(0.4),
                                            blurRadius: 10,
                                            spreadRadius: 4,
                                          ),
                                        ]
                                      : [],
                                ),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Losing Phase',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          'In this phase, low-calorie diet. you',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          'will experience rapid, healthy',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          'weight loss without hunger or',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          'cravings.',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 15),
                                    Expanded(
                                      child: Image(
                                        image: AssetImage('assets/fish.png'),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Transform.translate(
                            offset: Offset(
                              (_animPart3LTR.value * 2),
                              ((_animPart3.value * 2) +
                                  (_animPart3Neg.value * 2)),
                            ),
                            child: Opacity(
                              opacity: (_animOpacity3.value) -
                                  (_animOpacityNeg3.value),
                              child: ItemTaskWidget(
                                icon: 'assets/escala.png',
                                title: 'Measure today\'s Weight',
                                text:
                                    'It is better to log weight early in the morning for better results.',
                                isThemeDark: isThemeDark,
                                color: const Color(0xff4A83D9),
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(
                              (_animPart3LTR.value * 3),
                              ((_animPart3.value * 3) +
                                  (_animPart3Neg.value * 3)),
                            ),
                            child: Opacity(
                              opacity: (_animOpacity3.value) -
                                  (_animOpacityNeg3.value),
                              child: ItemTaskWidget(
                                icon: 'assets/checked.png',
                                title: 'Meal Intake for the day',
                                text:
                                    'Watching your calories is very important in your weight loss journey',
                                isThemeDark: isThemeDark,
                                color: const Color(0xff2CD14B),
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(
                              (_animPart3LTR.value * 4),
                              ((_animPart3.value * 4) +
                                  (_animPart3Neg.value * 4)),
                            ),
                            child: Opacity(
                              opacity: (_animOpacity3.value) -
                                  (_animOpacityNeg3.value),
                              child: ItemTaskWidget(
                                icon: 'assets/water-glass.png',
                                title: 'Had enough water today?',
                                text:
                                    'Water intake is important to get rid of toxins.',
                                isThemeDark: isThemeDark,
                                color: const Color(0xff65D7FE),
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(
                              (_animPart3LTR.value * 5),
                              ((_animPart3.value * 5) +
                                  (_animPart3Neg.value * 5)),
                            ),
                            child: Opacity(
                              opacity: (_animOpacity3.value) -
                                  (_animOpacityNeg3.value),
                              child: ItemTaskWidget(
                                icon: 'assets/cinta-metrica.png',
                                title: 'Body measurement for the week',
                                text:
                                    'Follow the instructions while measuring your body.',
                                isThemeDark: isThemeDark,
                                color: const Color(0xffBB82FF),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
        ),
      ),
    );
  }
}
