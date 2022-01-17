import 'package:flutter/material.dart';
import 'package:pricing/app/theme/color.dart';

class BuildButtonSelection extends StatelessWidget {
  final String buttonName;
  final bool flatStyle;
  final VoidCallback onPressed;

  const BuildButtonSelection({
    Key? key,
    required this.buttonName,
    required this.flatStyle,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: !flatStyle ? 0 : 3,
      color: Colors.transparent,
      shape: !flatStyle
          ? null
          : RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.5)),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.5),
            color: !flatStyle ? backgroundColor : const Color(0xffffffff),
            boxShadow: !flatStyle
                ? null
                : <BoxShadow>[
                    BoxShadow(
                        color: const Color(0xff000000).withOpacity(.1),
                        blurRadius: 4,
                        spreadRadius: 2),
                  ],
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 4, bottom: 3),
            child: Text(
              buttonName,
              style: const TextStyle(
                  color: Color(0xff000000),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
