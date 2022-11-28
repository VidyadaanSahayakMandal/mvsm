import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'big_square_button.g.dart';

@swidget
Widget bigSquareButton(
  BuildContext context, {
  required double size,
  required IconData icon,
  required Color color,
  required String subText,
  void Function()? onTap,
}) {
  return Material(
    color: color.withOpacity(0.5),
    borderRadius: BorderRadius.circular(16),
    child: InkWell(
      borderRadius: BorderRadius.circular(16),
      splashColor: color,
      onTap: onTap,
      child: SizedBox(
        height: size,
        width: size,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: size * 0.4,
              ),
              Center(
                  child: Text(
                subText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans'),
              ))
            ],
          ),
        ),
      ),
    ),
  );
}
