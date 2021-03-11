import 'package:flutter/material.dart';
import 'package:foreverfit/resource/resource.dart';
import 'package:foreverfit/signup/login_page.dart';
import 'package:foreverfit/screen/home/home_page.dart';
import 'package:foreverfit/connectionerror.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:foreverfit/forgot.dart';
class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var listener;

  @override
/*  void initState() {
    _prepareToNavigate();
    super.initState();
  }

  Future _prepareToNavigate() async {
    await Future.delayed(Duration(seconds: 1));
   // Navigator.of(context).pushReplacementNamed(RoutePath.home);


  }*/
  check() async {
    print("The statement 'this machine is connected to the Internet' is: ");
    print(await DataConnectionChecker().hasConnection);
    // returns a bool

    // We can also get an enum value instead of a bool
    print("Current status: ${await DataConnectionChecker().connectionStatus}");
    // prints either DataConnectionStatus.connected
    // or DataConnectionStatus.disconnected

    // This returns the last results from the last call
    // to either hasConnection or connectionStatus
    print("Last results: ${DataConnectionChecker().lastTryResults}");

    // actively listen for status updates
    // this will cause DataConnectionChecker to check periodically
    // with the interval specified in DataConnectionChecker().checkInterval
    // until listener.cancel() is called
    listener = DataConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case DataConnectionStatus.connected:
          print('Data connection is available.');
          break;
        case DataConnectionStatus.disconnected:
          print('You are disconnected from the internet.');
          break;
      }
    });

    // close listener after 30 seconds, so the program doesn't run forever
    //return await DataConnectionChecker().connectionStatus;
    await Future.delayed(Duration(seconds: 10));
    await listener.cancel();


  }


  Widget build(BuildContext context) {
    FirebaseAuth.instance.currentUser().then((user) async {
    //  DataConnectionStatus status = await check();
     // await Future.delayed(Duration(seconds: 1));
      var userLoggedIn = user != null;
    //  if (status == DataConnectionStatus.connected) {
        if (userLoggedIn) {

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        }
     // }
     /* else{
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => connecterror()),
        );


      }*/
    });

    return Container(
      child: Center(child: Image.asset(Resource.image.logo)),
      color: Colors.white,
    );
  }
}