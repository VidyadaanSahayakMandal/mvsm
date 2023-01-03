import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'dialog_budget.g.dart';

@swidget
Widget dialogBudget(BuildContext context, {required String title}) {
  return Padding(
    padding: const EdgeInsets.all(32.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 32,
          ),
        ),
        SizedBox(
          height: 40,
        ),
        DropdownButtonFormField(
          value: 'Budget Update',
          decoration: InputDecoration(
            label: Text('Request Type'),
            border: OutlineInputBorder(),
          ),
          items: [
            DropdownMenuItem(
                child: Text("Budget Update"), value: "Budget Update"),
          ],
          onChanged: (Object? value) {},
        ),
        SizedBox(
          height: 40,
        ),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            label: Text('Amount'),
          ),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ], // Only numbers can be entered
        ),
        SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text('SUBMIT'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.all(12),
                  textStyle: TextStyle(fontSize: 16)),
            )
          ],
        )
      ],
    ),
  );
}
