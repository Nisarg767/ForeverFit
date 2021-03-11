import 'package:foreverfit/screen/home/childrend/trainer/trainer_detail_page2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foreverfit/bmindbmr/main_page.dart';
import 'package:foreverfit/screen/home/childrend/challenges/challenges_detail_page.dart';
import 'package:foreverfit/exercisedetail.dart';
import 'package:foreverfit/resource/route.dart';
import 'package:foreverfit/screen/home/childrend/exercises/back_detail_page.dart';
import 'package:foreverfit/screen/home/childrend/exercises/biceps_detail_page.dart';
import 'package:foreverfit/screen/home/childrend/exercises/calfs_detail_page.dart';
import 'package:foreverfit/screen/home/childrend/exercises/exercise_detail_page.dart';
import 'package:foreverfit/screen/home/childrend/exercises/abs_detail_page.dart';
import 'package:foreverfit/screen/home/childrend/exercises/exercises_group_page.dart';
import 'package:foreverfit/screen/home/childrend/exercises/legs_detail_page.dart';
import 'package:foreverfit/screen/home/childrend/exercises/shoulder_detail_page.dart';
import 'package:foreverfit/screen/home/childrend/exercises/triceps_detail_page.dart';
import 'package:foreverfit/screen/home/childrend/healthtip/health_tip_detail_page.dart';
import 'package:foreverfit/screen/home/childrend/trainer/trainer_detail_page.dart';
import 'package:foreverfit/screen/home/home_page.dart';
import 'package:foreverfit/screen/splash/splash_page.dart';
import 'package:foreverfit/signup/login_page.dart';
import 'package:foreverfit/signup/signup_page.dart';
import 'package:foreverfit/registration.dart';
import 'package:foreverfit/diet/diet_detail_page.dart';
Route<dynamic> generateRoute(RouteSettings settings) {
  final args = settings.arguments;
  Widget pageResult;
  switch (settings.name) {
    case RoutePath.splash:
      pageResult = SplashPage();
      break;
    case RoutePath.home2:
      pageResult=Home();
      break;
    case RoutePath.shoulderdetail:
      pageResult=ShoulderDetailPage(args);
      break;
    case RoutePath.legsdetail:
      pageResult= LegsDetailPage(args);
      break;
    case RoutePath.calfsdetail:
      pageResult=CalfsDetailPage(args);
      break;
    case RoutePath.absdetail:
      pageResult=AbsDetailPage(args);
      break;
    case RoutePath.welcome:
      pageResult=SignUpScreen();
      break;
    case RoutePath.dietdetail:
      pageResult=DietDetailPage(args);
      break;
    case RoutePath.home:
      pageResult = HomePage();
      break;
    case RoutePath.healthTipDetail:
      pageResult = HealthTipDetailPage(args);
      break;
    case RoutePath.challengedetail:
      pageResult=ChallengesDetailPage(args);
      break;
    case RoutePath.exerciseGroup:
      pageResult = ExercisesGroupPage();
      break;
    case RoutePath.exerciseDetail:
      pageResult = ExerciseDetailPage(args);
      break;
    case RoutePath.backdetail:
      pageResult=BackDetailPage(args);
      break;
    case RoutePath.bicepsdetail:
      pageResult=BicepsDetailPage(args);
      break;

    case RoutePath.login:
      pageResult=LoginScreen();
      break;
    case RoutePath.tricepsdetail:
      pageResult=TricepsDetailPage(args);
      break;
    /*case RoutePath.trainerDetail:
      pageResult = TrainerDetailPage(args);
      break;*/
    case RoutePath.trainerDetail2:
      pageResult = TrainerDetailPage2(args);
      break;
  }
  print(pageResult);
  return _generateMaterialRoute(pageResult);
}

Route<dynamic> _generateMaterialRoute(Widget widget) {
  return MaterialPageRoute(builder: (_) => widget);
}
