import 'package:flutter/material.dart';
import 'package:foreverfit/bmindbmr/main_page.dart';
import 'package:foreverfit/screen/home/childrend/challenges/challenges_page.dart';
import 'package:foreverfit/exercise.dart';
import 'package:foreverfit/exercisedetail.dart';
import 'package:foreverfit/resource/resource.dart';
import 'package:foreverfit/screen/home/childrend/exercises/abs_page.dart';
import 'package:foreverfit/screen/home/childrend/exercises/back_page.dart';
import 'package:foreverfit/screen/home/childrend/exercises/biceps_page.dart';
import 'package:foreverfit/screen/home/childrend/exercises/calfs_page.dart';
import 'package:foreverfit/screen/home/childrend/exercises/exercises_group_page.dart';
import 'package:foreverfit/screen/home/childrend/exercises/legs_page.dart';
import 'package:foreverfit/screen/home/childrend/exercises/shoulder_page.dart';
import 'package:foreverfit/screen/home/childrend/exercises/triceps_page.dart';
import 'package:foreverfit/screen/home/childrend/healthtip/health_tip_page.dart';
import 'package:foreverfit/screen/home/childrend/trainer/trainers_page.dart';
import 'package:foreverfit/screen/home/childrend/workoutplan/workout_plan_page.dart';
import 'package:foreverfit/screen/home/home_tab_bar.dart';

import 'package:provider/provider.dart';
import 'package:foreverfit/services/theme_changer.dart';
class exercisePage extends StatefulWidget {
  @override
  _exercisePage createState() => _exercisePage();
}

class _exercisePage extends State<exercisePage> with TickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;
  int currentIndex = 0;
  int _index = 0;

  @override
  void initState() {
    _tabController =
        TabController(length: pages.length, initialIndex: 0, vsync: this);
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  Widget _buildPageView() {
    return Expanded(
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (_, index) {
          return pages.values.toList()[index]();
        },
        itemCount: pages.length,
        onPageChanged: _onPageChanged,
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        HomeTabBar(
          tabController: _tabController,
          names: pages.keys.toList(),
          onTap: _onTabSelected,
        ),
        _buildPageView(),

      ],

    );
  }
  void _onTabSelected(int index) {
    if (_pageController.page.toInt() != index) {
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 2), curve: Curves.ease);
    }
  }

  void _onPageChanged(int index) {
    _tabController.animateTo(index);
  }


  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      body: _buildBody(),

      );

  }
  final pages = {
    "Chest": () => ExercisesGroupPage(),
    "Shoulder": () => ShoulderPage(),
    "Back": () => BackPage(),
    "Biceps": () => BicepsPage(),
    "Triceps": () => TricepsPage(),
    "Abs": () => AbsPage(),
    "Legs": () => LegsPage(),
    "Calf": () => CalfsPage(),

  };
}
