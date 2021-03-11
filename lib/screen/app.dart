import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foreverfit/screen/home/home_page.dart';
import 'package:foreverfit/user.dart';
import 'package:provider/provider.dart';
import 'package:foreverfit/services/theme_changer.dart';
import 'package:foreverfit/theme.dart';
import 'package:foreverfit/resource/route.dart';
import 'package:foreverfit/screen/route_config.dart';
//import "package:foreverfit/screen/splash/splash_page.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foreverfit/signup/login_page.dart';
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]

    );


    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(),
      child: Builder(builder: (context) {

        return MaterialApp(
          builder: (BuildContext context, Widget child) {
            final MediaQueryData data = MediaQuery.of(context);
            return MediaQuery(
              data: data.copyWith(
                  textScaleFactor: 1.2),
              child: child,
            );
          },

          debugShowCheckedModeBanner: false,
      //    initialRoute: FirebaseAuth.instance.currentUser == null ? RoutePath.home:RoutePath.login,
          initialRoute: RoutePath.splash,
          title: "Forever Fit",

          theme:
          ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark,fontFamily: "Geometria"),

          themeMode: ThemeMode.system,
          darkTheme: ThemeData(brightness: Brightness.dark),
          //darkTheme: Style.get(true),
          //theme:Style.get(false),
          onGenerateRoute: generateRoute,
        );
      }),
    );
  }
}


