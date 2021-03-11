import 'package:flutter/material.dart';
import 'package:foreverfit/bmindbmr/background_card.dart';
import 'package:foreverfit/bmindbmr/main_page.dart';
import 'package:foreverfit/contactus.dart';
import 'package:foreverfit/screen/home/childrend/challenges/challenges_page.dart';
import 'package:foreverfit/exercise.dart';
import 'package:foreverfit/resource/resource.dart';
import 'package:foreverfit/screen/home/childrend/healthtip/health_tip_page.dart';
import 'package:foreverfit/screen/home/childrend/trainer/trainers_page.dart';
import 'package:foreverfit/screen/home/home_tab_bar.dart';
import 'package:flutter_greetings/flutter_greetings.dart';
import 'package:provider/provider.dart';
import 'package:foreverfit/diet/beginner.dart';
import 'package:foreverfit/services/theme_changer.dart';
import 'package:foreverfit/profile.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
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

      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("ForeverFit",textScaleFactor: 1.0),

        backgroundColor: Resource.color.mainColorDark,
       actions: <Widget>[
         Padding(
           padding:EdgeInsets.only(top:5),
           child:BackgroundCard(
             childContainer:Container(
           child:Text(
              YonoGreetings.showGreetings(),
           ),
           ),
           ),
         ),
         ]
      ),
      body: IndexedStack(

        index: currentIndex,
        children: <Widget>[
          _buildBody(),
          exercisePage(),
          Home(),
          //Profile(),
         MyAccount(),
         // HomeUI(),

        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),title: Container()
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),title: Container()

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),title:Container()
          )
        ],
        selectedItemColor: Resource.color.mainColorLight,
        unselectedItemColor: Colors.grey,
      ),

    );
  }
  final pages = {
    "Fitness tip": () => HealthTipPage(),
    "Challenges": () => ChallengesPage(),
    "Trainers": () => TrainersPage(),
    "Diet": () => Beginner(),
    "About us":()=> contact(),
  };
}
