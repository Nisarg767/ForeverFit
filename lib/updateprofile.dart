import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import "package:flutter/material.dart";
import 'package:foreverfit/profile.dart';
import 'package:foreverfit/user.dart';
import 'package:foreverfit/progress.dart';
import 'package:foreverfit/main.dart';
import 'package:foreverfit/screen/app.dart';
class EditProfile extends StatefulWidget {
  final String currentUserId;
  EditProfile({this.currentUserId});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  TextEditingController displayNameController = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController displayNameController2 = TextEditingController();
  TextEditingController displaymobileController = TextEditingController();
  TextEditingController _userName, _userName2, _usermob;
  MyAccount acc;
  bool isLoading = false;
  User user;
  bool _displayNameValid = true;
  bool _emailvalid = true;
  bool _displayName2Valid = true;
  bool _bioValid = true;
  final usersRef = Firestore.instance.collection('users');
  User currentUserModel;
  FirebaseUser loggedInUser;
  var _userN;
  var _userN2;
  var _useremail;

  bool _loading = false;
  bool _enabled = false;

  @override
  void initState() {
    super.initState();
    getUser();
    _getemail();
    _getmobile();
    _getUserN();
    _getUserN2();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  String validateMobile(String value) {
    String pattern = r'^(?:[+0][1-9])?[0-9]{10,12}$';
    RegExp regExp = new RegExp(pattern);
// Indian Mobile number are of 10 digit only
    if (!regExp.hasMatch(value))
      return 'Mobile Number must be of 10 digit';
    else
      return null;
  }

  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }


  String validateName(String value) {
    final RegExp nameRegExp = RegExp('[a-zA-Z]');

    if (!nameRegExp.hasMatch(value)) {
      return 'Please enter some text';
    }
    return null;
  }


  getUser() async {
    if (mounted)
      setState(() {
        _loading = true;
      });
    DocumentSnapshot doc = await usersRef.document(widget.currentUserId).get();
    user = User.fromDocument(doc);
    displayNameController.text = user.firname;
    displayNameController2.text = user.laname;
    displaymobileController.text = user.mobile;
    emailcontroller.text = user.email;
  }

  Future<void> _getUserN() async {
    if (mounted) setState(() {
      _loading = true;
    });
    Firestore.instance
        .collection('users')
        .document((await FirebaseAuth.instance.currentUser()).uid)
        .get()
        .then((value) {
      setState(() {
        displayNameController.text = value.data['displayName'].toString();
      });
    });
  }

  Future<void> _getUserN2() async {
    if (mounted) setState(() {
      _loading = true;
    });
    Firestore.instance
        .collection('users')
        .document((await FirebaseAuth.instance.currentUser()).uid)
        .get()
        .then((value) {
      setState(() {
        displayNameController2.text = value.data['lname'].toString();
      });
    });
  }

  Future<void> _getemail() async {
    if (mounted) setState(() {
      _loading = true;
    });
    Firestore.instance
        .collection('users')
        .document((await FirebaseAuth.instance.currentUser()).uid)
        .get()
        .then((value) {
      setState(() {
        emailcontroller.text = value.data['email'].toString();
      });
    });
  }

  Future<void> _getmobile() async {
    if (mounted) setState(() {
      _loading = true;
    });
    Firestore.instance
        .collection('users')
        .document((await FirebaseAuth.instance.currentUser()).uid)
        .get()
        .then((value) {
      setState(() {
        displaymobileController.text = value.data['mobile'].toString();
      });
    });
  }


  updateProfileData() async {
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    if (_formKey.currentState.validate()) {
      usersRef.document(firebaseUser.uid).updateData({
        "displayName": displayNameController.text,
        "lname": displayNameController2.text,
        "email": emailcontroller.text,
        "mobile": displaymobileController.text,
      });


      SnackBar snackbar = SnackBar(content: Text("Profile updated!"));
      _scaffoldKey.currentState.showSnackBar(snackbar);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => App()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    void showAlertDialog(BuildContext context) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            TextEditingController _emailControllerField =
            TextEditingController();
            return CircularProgressIndicator(
              backgroundColor: Colors.red,
              strokeWidth: 8,);
          });
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(

          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    radius: 100,

                    child: Image.asset(

                      "image/blacklogo.jpg",
                    ),
                  ),


                  Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Text(
                        "First Name",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 15.0,
                  ),

                  TextFormField(
                    controller: displayNameController,
                    decoration: InputDecoration(

                    ),
                    autovalidate: true,
                    validator: validateName,


                  ),

                  Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Text(
                        "Last Name",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 15.0,
                  ),

                  TextFormField(
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    controller: displayNameController2,
                    decoration: InputDecoration(

                    ),
                    autovalidate: true,
                    validator: validateName,


                  ),
                  // emailField,


                  Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Text(
                        "Email",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 15.0,
                  ),

                  TextFormField(
                    controller: emailcontroller,
                    decoration: InputDecoration(

                    ),
                    autovalidate: true,
                    validator: validateEmail,


                  ),

                  Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Text(
                        "Mobile Number",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 15.0,
                  ),

                  TextFormField(
                    controller: displaymobileController,
                    decoration: InputDecoration(


                    ),
                    autovalidate: true,
                    validator: validateMobile,


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
                        if (_formKey.currentState.validate()) {
                          //           CircularProgressIndicatorApp();
                          //   await _changeLoadingVisible();
                          /*    setState((){
                            _loading = true;
                          });*/ // set loading to true here
                          var firebaseUser = await FirebaseAuth.instance.currentUser();
                          if (_formKey.currentState.validate()) {
                            usersRef.document(firebaseUser.uid).updateData({
                              "displayName": displayNameController.text,
                              "lname": displayNameController2.text,
                              "email": emailcontroller.text,
                              "mobile": displaymobileController.text,
                            });


                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => App()));
                          }

                        }
                      },
                      child: Text("Update Profile",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center
                      ),
                    ),
                  ),
                  //  loginButon,
                  SizedBox(
                    height: 15.0,
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

                        Navigator.of(context).pop();
                        },



                      child: Text("Cancel",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center
                      ),
                    ),
                  ),


                  GestureDetector(

                    onTap: () {
                      Navigator.of(context).pop();
                      },
                    child: Text("Cancel",
                        style: TextStyle(color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            decoration: TextDecoration.underline),
                        textAlign: TextAlign.center
                    ),
                  ),

                  SizedBox(
                    height: 25.0,
                  ),
                ],
              ),

            ),

          ),


        ),
      ),
    );
  }

}

