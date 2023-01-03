import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'goal.g.dart';

@swidget
Widget goal(
  BuildContext context, {
  required MaterialColor color,
  required double width,
  required IconData icon,
  required String title,
  required String description,
}) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 16,
      bottom: 32,
    ),
    child: Card(
      elevation: 16,
      shadowColor: color,
      color: color.shade300,
      child: SizedBox(
        width: width,
        child: Stack(
          children: [
            Positioned(
              bottom: 20,
              right: 20,
              child: Icon(
                icon,
                size: 40,
                color: color.shade900,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Card(
                        elevation: 0,
                        color: color.shade200,
                        shape: CircleBorder(side: BorderSide(width: 1)),
                        child: IconButton(
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.black54,
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (builder) => AlertDialog(
                                title: Text('$title Goal'),
                                content: const SingleChildScrollView(
                                  child: TextField(
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Goal Description',
                                    ),
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Text(
                        description,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
