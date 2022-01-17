import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pricing/app/theme/color.dart';

class SelectPlugsWidget extends StatelessWidget {
  const SelectPlugsWidget({
    Key? key,
    required this.title,
    required this.value,
    required this.imageSVG,
    required this.selectPlugs,
    this.onTap,
  }) : super(key: key);

  final String title;
  final String value;
  final String imageSVG;
  final bool selectPlugs;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 24,
              width: 24,
              child: SvgPicture.asset(
                imageSVG,
                color: blueBlueTwo,
                placeholderBuilder: (BuildContext context) =>
                    const CircularProgressIndicator(),
              ),
            ),
            const SizedBox(
              width: 18,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 14),
                ),
                Text(
                  value,
                  style: TextStyle(
                      fontSize: 12,
                      color: const Color(0xff000000).withOpacity(.5)),
                ),
              ],
            ),
          ],
        ),
        if (!selectPlugs)
          IconButton(
              onPressed: onTap,
              icon: Icon(
                Icons.circle_outlined,
                size: 24,
                color: blueBlueTwo,
              ))
        else
          IconButton(
              onPressed: onTap,
              icon: Icon(
                Icons.check_circle,
                size: 24,
                color: blueBlueTwo,
              )),
      ],
    );
  }
}
