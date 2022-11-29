import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'dialog_budget.g.dart';

@swidget
Widget dialogBudget(BuildContext context) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
        ),
      ),
    ),
  );
}
