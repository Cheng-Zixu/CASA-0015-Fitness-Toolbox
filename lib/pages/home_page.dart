import 'package:fitness_toolbox/pages/calories_page.dart';
import 'package:fitness_toolbox/pages/exercise_page.dart';
import 'package:fitness_toolbox/pages/history_page.dart';
import 'package:fitness_toolbox/pages/user_page.dart';
import 'package:flutter/material.dart';

import '../config/Configs.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePage();

}

class _HomePage extends State<HomePage> {
  final pages = [ExercisePage(), CaloriesPage(), HistoryPage(), UserPage()];

  final List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
      backgroundColor: Colors.black,
      icon: SizedBox(child: Image.asset("assets/images/ic_exercise.png",),width: 24, height: 24,),
      label: Configs.Exercise,
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.black,
      icon: SizedBox(child: Image.asset("assets/images/ic_calories.png",),width: 24, height: 24,),
      label: Configs.Calories,
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.black,
      icon: SizedBox(child: Image.asset("assets/images/ic_history.png",),width: 24, height: 24,),
      label: Configs.History,
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.black,
      icon: SizedBox(child: Image.asset("assets/images/ic_user.png",),width: 24, height: 24,),
      label: Configs.My,
    ),
  ];

  int currentIndex;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fitness Toolbox'),
      ),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavItems,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _changePage(index);
        },
      ),
      body: pages[currentIndex],

    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = 0;
  }

  void _changePage(int index) {
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
      });
    }
  }

}