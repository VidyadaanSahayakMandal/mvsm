import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:svsm/widgets/vsm_logo_stack.dart';

import '../widgets/goal.dart';
import '../widgets/square_button.dart';

part 'goals.g.dart';

@swidget
Widget goals(BuildContext context) {
  double height = MediaQuery.of(context).size.height / 2.5;
  return VSMLogoStack(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Your Goals',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: height,
            child: ListView(
              // This next line does the trick.
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Goal(
                  width: MediaQuery.of(context).size.width / 1.8,
                  color: Colors.lightGreen,
                  icon: Icons.menu_book,
                  title: 'Academic',
                  description:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing'
                      'elit, sed do eiusmod tempor incididunt ut labore et ',
                ),
                Goal(
                  width: MediaQuery.of(context).size.width / 1.8,
                  color: Colors.green,
                  icon: Icons.school_rounded,
                  title: 'Learning',
                  description:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing '
                      'elit, sed do eiusmod tempor incididunt ut labore et ',
                ),
                Goal(
                  width: MediaQuery.of(context).size.width / 1.8,
                  color: Colors.lime,
                  icon: Icons.person_pin,
                  title: 'Personal',
                  description:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing '
                      'elit, sed do eiusmod tempor incididunt ut labore et ',
                ),
                Goal(
                  width: MediaQuery.of(context).size.width / 1.8,
                  color: Colors.teal,
                  icon: Icons.nature_people_rounded,
                  title: 'Social',
                  description:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing '
                      'elit, sed do eiusmod tempor incididunt ut labore et ',
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            'Recent Goal Updates',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListView(
              children: const <Widget>[
                ListTile(
                  title: Text(
                    'Learning',
                  ),
                  subtitle: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                    textAlign: TextAlign.justify,
                  ),
                ),
                ListTile(
                  title: Text(
                    'Social',
                  ),
                  subtitle: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                    textAlign: TextAlign.justify,
                  ),
                ),
                ListTile(
                  title: Text('Academic'),
                  subtitle: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                    textAlign: TextAlign.justify,
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
