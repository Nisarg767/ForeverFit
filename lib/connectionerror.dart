import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foreverfit/screen/app.dart';
class connecterror extends StatefulWidget {
  @override
  _connecterrorState createState() => _connecterrorState();
}


class _connecterrorState extends State<connecterror> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
 }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(

          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  SizedBox(

                    child: Image.asset(


                      "image/InternetError.jpg",
                    ),
                  ),

                  SizedBox(
                    height: 35.0,
                  ),
                  Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(32.0),
                    color: Colors.pink,
                    child: MaterialButton(
                      minWidth: MediaQuery
                          .of(context)
                          .size
                          .width,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => App()));
                        },
                      child:Text("Refresh",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center
                      ),
                    ),
                  ),
                  //  loginButon,
                ],
              ),

            ),

          ),


        ),
      ),
    );
  }


}

