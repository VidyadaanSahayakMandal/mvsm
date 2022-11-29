import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'task.g.dart';

@swidget
Widget taskWidget(BuildContext context,
    {String title = '',
    String subtitle = '',
    MaterialColor color = Colors.pink,
    int i = 0}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      shadowColor: color,
      color: color.shade200,
      elevation: 4,
      child: Stack(
        children: [
          Positioned(
            right: 20,
            bottom: i % 2 == 0 ? -20 : null,
            top: i % 2 != 0 ? -20 : null,
            child: Container(
              alignment: Alignment.bottomRight,
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                  color: color.shade100,
                  borderRadius: BorderRadius.circular(50)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: ListTile(
              visualDensity: VisualDensity.compact,
              title: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                subtitle,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
