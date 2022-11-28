import 'package:flutter/material.dart';
import '../widgets/task.dart';
import '../widgets/vsm_logo_stack.dart';
import '../widgets/square_button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return VSMLogoStack(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              SquareButton(
                icon: Icons.person,
                size: 55,
                color: Colors.lightBlue,
              ),
            ],
          ),
          Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 2,
                  horizontal: 16,
                ),
                child: Row(
                  children: const [
                    Text(
                      "Hello, Pushkar",
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.w600,
                        fontSize: 40,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                child: Row(
                  children: const [
                    Text(
                      "You have 4 pending tasks",
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.w800,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height - 330,
                child: ListView(
                  children: const [
                    TaskWidget(
                      title: 'VSM Event- Job Interviews',
                      subtitle: '15 Nov- 19:00',
                      i: 0,
                    ),
                    TaskWidget(
                      title: 'VSM Event- How to Crack DSA?',
                      subtitle: '25 Nov- 19:00',
                      i: 1,
                    ),
                    TaskWidget(
                      title: 'College- Project Submission',
                      subtitle: '26 Nov- 00:00',
                      i: 2,
                      color: Colors.purple,
                    ),
                    TaskWidget(
                      title: 'VSM Process- Submit Monthly Report',
                      subtitle: '30 Nov- 00:00',
                      color: Colors.orange,
                      i: 3,
                    ),
                    TaskWidget(
                      title: 'VSM Process- Submit Monthly Report',
                      subtitle: '30 Nov- 00:00',
                      color: Colors.orange,
                      i: 4,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
