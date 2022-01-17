import 'package:flutter/material.dart';
import 'package:pricing/app/modules/home/local_widget/build_button_selection.dart';
import 'package:pricing/app/theme/color.dart';

class SelectWidget extends StatelessWidget {
  const SelectWidget({
    required this.title,
    Key? key,
    this.optionTitle1,
    this.optionTitle2,
    this.flatStyle,
    this.onPressed,
    this.value,
  }) : super(key: key);

  final String title;
  final String? optionTitle1;
  final String? optionTitle2;
  final bool? flatStyle;
  final void Function(bool value)? onPressed;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 9),
            child: Text(
              title,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          if (onPressed != null) 
          Container(
            width: 170,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.8),
                color: backgroundColor),
            child: Padding(
              padding: const EdgeInsets.all(1),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      child: BuildButtonSelection(
                        buttonName: optionTitle1!,
                        flatStyle: flatStyle!,
                        onPressed:()=> onPressed!(true),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      child: BuildButtonSelection(
                        buttonName: optionTitle2!,
                        flatStyle: !flatStyle!,
                        onPressed: ()=> onPressed!(false),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
          else
           Text(value!, style: TextStyle(fontSize: 14, color: blueBlueTwo),)
        ],
      ),
    );
  }
}