import 'dart:async';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/painting.dart';
import 'package:foreverfit/signup/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foreverfit/user.dart';
import 'package:foreverfit/updateprofile.dart';
import 'package:foreverfit/signup/signup_page.dart';
class MyAccount extends StatefulWidget {
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseUser currentUser;
  var _userName;
  var  _userName2;
  var  _useremail;
  var  _usermob;
  //final firestoreInstance = Fireba.instance;
  bool _loading=false;
  var _name;
  User variant;
  EditProfile editable;
 TextEditingController _fname = TextEditingController();

  StreamSubscription<DataConnectionStatus> listener;

 /* editProfile() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EditProfile(currentUserId: currentUserId)));
  }*/

  @override
  void initState() {
    super.initState();
    _getUserName();
    _getUserName2();
    _getmobile();
    _loadCurrentUser();
   // userName();
  }
  @override
  void dispose() {
    listener.cancel();
    // TODO: implement dispose
    super.dispose();
  }

  void _loadCurrentUser() {
    firebaseAuth.currentUser().then((FirebaseUser user) {
     if(mounted) setState(() {
        // call setState to rebuild the view
        this.currentUser = user;

      });
    });
  }

  Future<void> _getUserName() async {
   if(mounted) setState((){
      _loading = true;
    });
    Firestore.instance
        .collection('users')
        .document((await FirebaseAuth.instance.currentUser()).uid)
        .get()
        .then((value) {
      setState(() {
        _userName = value.data['lname'].toString();
      });
    });
  }
  Future<void> _getUserName2() async {
    if(mounted)setState((){
      _loading = true;
    });
    Firestore.instance
        .collection('users')
        .document((await FirebaseAuth.instance.currentUser()).uid)
        .get()
        .then((value) {
      setState(() {
        _userName2 = value.data['displayName'].toString();
      });
    });
  }
   Future<void> _getmobile() async {
     if(mounted)setState((){
      _loading = true;
    });
    Firestore.instance
        .collection('users')
        .document((await FirebaseAuth.instance.currentUser()).uid)
        .get()
        .then((value) {
      setState(() {
        _usermob = value.data["mobile"].toString();
      });
    });
  }

  Future<void> getData(userID) async {
// return await     Firestore.instance.collection('users').document(userID).get();
    DocumentSnapshot result = await Firestore.instance.collection('users').document(userID).get();
    return result;
  }

  /*void _userDetails(userID) async {
    final userDetails = getData(userID);
    setState(() {
      fname =  userDetails.toString();
      new Text(firstName);
    });
  }*/



  String userName() {
    if (currentUser != null) {
       return '';
    } else {
      return "Niiii";
    }
  }
   phone(){
    if(currentUser!=null){
      return currentUser.phoneNumber;
    }else{
      return"";
    }
  }
  String email() {
    if (currentUser != null) {
      return currentUser.email;
    } else {
      return "Guest User";
    }
  }
  QuerySnapshot querySnapshot;
  TextEditingController fname = TextEditingController();
  DatabaseReference ref = FirebaseDatabase.instance.reference();



@override
  Widget build(BuildContext context) {
//  appState = StateWidget.of(context).state;

  return Scaffold(
     backgroundColor:Colors.black,
      body: Padding(

        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0,0,0,0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Profiles details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  Container(height: 24,width: 24)
                ],
              ),
            ),

            SizedBox(
              height: 10.0,
            ),

            CircleAvatar(
              radius: 100,

              child: Image.asset(

                "image/blacklogo.jpg",
              ),
            ),



    /*Card(
              elevation: 5.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(

                    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                    child: Text(
                      "Last Name:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                    child: Text(
                        "$_userName"
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          left: 25.0, right: 25.0, top: 25.0),
                      child: new Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          new Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              new Text(
                                'Last Name : '  "$_userName",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                    child: Container(
                      height: 60,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("$_userName", style: TextStyle(color: Colors.white70),),
                        ),
                      ), decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),border: Border.all(width: 1.0, color: Colors.white70)),
                    ),
                  ),



                  Divider(
                    height: 2.0,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                    child: Text(
                      "Email:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                    child: Text(
                      "${email()}",
                    ),
                  ),
                  Divider(
                    height: 2.0,
                  ),

                  Container(
                    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                    child: Text(
                      "Phone:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                    child: Text(
                      "${phone()}",
                    ),
                  ),

                ],
              ),
            ),*/

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
              child: Container(
                height: 60,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("$_userName2", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  ),
                ), decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),border: Border.all(width: 1.0, color: Colors.white70)),
              ),
            ),

            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
              child: Container(
                height: 60,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("$_userName", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  ),
                ), decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),border: Border.all(width: 1.0, color: Colors.white70)),
              ),
            ),

            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
              child: Container(
                height: 60,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${email()}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  ),
                ), decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),border: Border.all(width: 1.0, color: Colors.white70)),
              ),
            ),

            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
              child: Container(
                height: 60,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("$_usermob", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                  ),
                ), decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),border: Border.all(width: 1.0, color: Colors.white70)),
              ),
            ),

            SizedBox(
              height: 10.0,
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
                onPressed: () {
                  firebaseAuth.signOut().then((user) {

                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  }).catchError((e) => print(e.toString()));
                },


                child: Text("Log Out",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center
                ),
              ),
            ),

            SizedBox(
              height: 10.0,
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
                          builder: (context) => EditProfile()));


                },




                child: Text("Edit Profile",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
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
                  await firebaseAuth.sendPasswordResetEmail(email: email());
                  passwordResetDialog();

                },



                child: Text("Reset Password",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center
                ),
              ),
            ),







          ],
        ),
      ),
    );
  }
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
     return await DataConnectionChecker().connectionStatus;

  }


  void passwordResetDialog() {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    var alert = AlertDialog(
        content: Text(
            "Password Reset Link Has Been Sent To ${email()}"),
        actions: [
          okButton,
        ],



    );
    showDialog(context: context, builder: (_) => alert);
  }

  TextStyle _btnStyle() {
    return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
  }
  /*void _userEditBottomSheet(BuildContext context) {
    widget(
      builder: (BuildContext bc) {
        return Container(

          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 0.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("Update Profile"),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.cancel),
                      color: Colors.orange,
                      iconSize: 25,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: TextField(

                          controller: _fname,
                          decoration: InputDecoration(
                            helperText: "Name",

                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: Text('Save'),
                      color: Colors.green,
                      textColor: Colors.white,
                      onPressed: () async {
                       /* user.homeCountry = SignUpScreen;
                        setState(() {
                          SignUpScreen.fnameController = _fname.text;
                        });
                        final uid =
                        await Provider.of(context).auth.getCurrentUID();
                        await Provider.of(context)
                            .db
                            .collection('userData')
                            .document(uid)
                            .setData(user.toJson());
                        Navigator.of(context).pop();*/
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }*/


}