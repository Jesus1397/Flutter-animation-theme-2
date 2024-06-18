import 'package:flutter/material.dart';

class ItemTaskWidget extends StatelessWidget {
  final String icon;
  final String title;
  final String text;
  final bool isThemeDark;
  final Color color;

  const ItemTaskWidget(
      {super.key,
      required this.icon,
      required this.title,
      required this.text,
      required this.isThemeDark,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 50,
            width: 50,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            decoration: BoxDecoration(
              color: isThemeDark
                  ? const Color(0xff2C2C2C)
                  : const Color(0xfff4f4f4),
              boxShadow: [
                BoxShadow(
                  blurRadius: 12,
                  color: isThemeDark
                      ? const Color(0xff323232)
                      : const Color(0xffababab),
                  offset: const Offset(
                    6,
                    6,
                  ),
                ),
                BoxShadow(
                  blurRadius: 12,
                  color: isThemeDark
                      ? const Color(0xff191919)
                      : const Color(0xffEAEAEA),
                  offset: const Offset(
                    -6,
                    -6,
                  ),
                ),
              ],
              gradient: null,
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  30,
                ),
              ),
            ),
            child: Stack(
              children: [
                if (isThemeDark)
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: color.withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                Center(
                  child: Image(
                    image: AssetImage(icon),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: isThemeDark
                    ? const Color(0xff2C2C2C)
                    : const Color(0xfff4f4f4),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 12,
                    color: isThemeDark
                        ? const Color(0xff323232)
                        : const Color(0xffababab),
                    offset: const Offset(
                      6,
                      6,
                    ),
                  ),
                  BoxShadow(
                    blurRadius: 12,
                    color: isThemeDark
                        ? const Color(0xff191919)
                        : const Color(0xffEAEAEA),
                    offset: const Offset(
                      -6,
                      -6,
                    ),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xff545454),
                    ),
                    softWrap: true,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    text,
                    softWrap: true,
                    style: const TextStyle(
                      color: Color(0xffBEC9CF),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
