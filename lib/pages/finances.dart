import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import '../widgets/big_square_button.dart';
import '../widgets/vsm_logo_stack.dart';
import '../widgets/square_button.dart';
import 'dialog_budget.dart';

part 'finances.g.dart';

@swidget
Widget finances(BuildContext context) {
  return VSMLogoStack(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Your Finances',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              // SquareButton(
              //   color: Colors.deepOrange,
              //   size: 40,
              //   icon: Icons.add,
              // ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: Card(
                  elevation: 24,
                  shadowColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      gradient: LinearGradient(
                        colors: [Colors.lightBlue, Colors.deepPurple],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Monthly Budget',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '₹1000',
                                style: TextStyle(
                                    fontSize: 32, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const Positioned(
                              bottom: 0,
                              right: 0,
                              child: Icon(
                                Icons.auto_awesome,
                                color: Colors.white70,
                                size: 60,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BigSquareButton(
                size: MediaQuery.of(context).size.width * 0.25,
                icon: Icons.book,
                color: Colors.green,
                subText: 'Budget',
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.green.shade200,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(24.0)),
                    ),
                    builder: (builder) {
                      return const DialogBudget(
                        title: 'Budget',
                      );
                    },
                  );
                },
              ),
              BigSquareButton(
                size: MediaQuery.of(context).size.width * 0.25,
                icon: Icons.add_chart_rounded,
                color: Colors.lightGreen,
                subText: 'Expenditure',
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.lightGreen.shade200,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(24.0)),
                    ),
                    builder: (builder) {
                      return const DialogBudget(
                        title: 'Expenditure',
                      );
                    },
                  );
                },
              ),
              BigSquareButton(
                size: MediaQuery.of(context).size.width * 0.25,
                color: Colors.lime,
                icon: Icons.bubble_chart_rounded,
                subText: 'Advance Request',
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.lime.shade200,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(24.0)),
                    ),
                    builder: (builder) {
                      return const DialogBudget(title: 'Advance Request');
                    },
                  );
                },
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                'Transactions',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: const <Widget>[
                ListTile(
                  textColor: Colors.green,
                  iconColor: Colors.green,
                  leading: Icon(Icons.insert_chart_outlined_rounded),
                  title: Text('₹1000'),
                  subtitle: Text(
                    'Approved Expenditure',
                  ),
                ),
                ListTile(
                  textColor: Colors.red,
                  iconColor: Colors.red,
                  leading: Icon(Icons.outbond_rounded),
                  title: Text('₹100'),
                  subtitle: Text('Books'),
                ),
                ListTile(
                  textColor: Colors.orange,
                  iconColor: Colors.orange,
                  leading: Icon(Icons.output_rounded),
                  title: Text('₹100'),
                  subtitle: Text('Advance Request, books'),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
