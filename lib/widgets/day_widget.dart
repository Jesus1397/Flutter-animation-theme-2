import 'package:flutter/material.dart';

class DayWidget extends StatelessWidget {
  final bool isThemeDark;
  final int index;

  const DayWidget({super.key, required this.isThemeDark, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color:
                isThemeDark ? const Color(0xff323232) : const Color(0xffababab),
            offset: const Offset(
              2,
              2,
            ),
          ),
          BoxShadow(
            blurRadius: 8,
            color:
                isThemeDark ? const Color(0xff191919) : const Color(0xffEAEAEA),
            offset: const Offset(
              -2,
              -2,
            ),
          ),
        ],
        gradient: LinearGradient(
          stops: const [0, 1],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isThemeDark
              ? [
                  const Color(0xff2C2C2C),
                  const Color(0xff2C2C2C),
                ]
              : [
                  const Color(0xffc1c1c1),
                  const Color(0xffffffff),
                ],
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            10,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            index.toString(),
            style: const TextStyle(
              color: Color(0xffF8787B),
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'MON',
            style: TextStyle(
              color: Color(0xffF8787B),
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
