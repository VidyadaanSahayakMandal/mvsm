import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'task.g.dart';

@swidget
Widget taskWidget(
  BuildContext context, {
  String title = '',
  String subtitle = '',
  Color color = Colors.pink,
  int i = 0,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      shadowColor: color,
      color: color,
      elevation: 24,
      child: Stack(
        children: [
          Positioned(
            right: -70,
            bottom: i % 2 == 0 ? -70 : null,
            top: i % 2 != 0 ? -70 : null,
            child: Container(
              alignment: Alignment.bottomRight,
              height: 140,
              width: 140,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100)),
            ),
          ),
          Positioned(
            right: -40,
            bottom: i % 2 == 0 ? -40 : null,
            top: i % 2 != 0 ? -40 : null,
            child: Container(
              alignment: Alignment.bottomRight,
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(100)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
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
