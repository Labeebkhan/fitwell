import 'package:flutter/material.dart';
import 'package:fitwell/widgets/CategorySection.dart';
import 'package:fitwell/widgets/progresscard.dart';
import 'package:fitwell/widgets/homedrawer.dart';
import 'package:fitwell/widgets/ExerciseSec.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      endDrawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 18, right: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/profile3.jpg'),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        'Labeeb Khan',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Get Ready 🔥',
                        style: TextStyle(color: Colors.white70, fontSize: 13),
                      ),
                    ],
                  ),
                  const Spacer(),

                  // 🔘 Menu Icon that opens right drawer
                  GestureDetector(
                    onTap: () {
                      _scaffoldKey.currentState?.openEndDrawer();
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.white10,
                      radius: 25,
                      child: Icon(Icons.menu, color: Colors.white, size: 23),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              ProgressCard(),
              const SizedBox(height: 40),
              CategoryScreen(),
              const SizedBox(height: 50),
              ExerciseContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
