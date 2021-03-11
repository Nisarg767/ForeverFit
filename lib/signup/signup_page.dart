import 'dart:io';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:flutter/material.dart';
import 'package:foreverfit/loading.dart';
import 'package:foreverfit/resource/resource.dart';
import 'package:foreverfit/screen/home/home_page.dart';
import 'package:toast/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:foreverfit/screen/route_config.dart';
import 'package:foreverfit/signup/login_page.dart';
import 'package:email_validator/email_validator.dart';
enum authProblems { UserNotFound, PasswordNotValid, NetworkError }
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _formKey = GlobalKey<FormState>();

  FocusNode focusEmail,focusPass,focusFname,focusLname,focusMob;
  bool passVisible = false;
  String email,password,fname,lname,mob;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController mobController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool _loading = false;
  String _errorMessage = '';
  PersistentBottomSheetController _sheetController;
  String errorMsg = "";
  bool _autoValidate = false;


  /*String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }*/

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    focusFname = FocusNode();
    focusLname = FocusNode();
    focusEmail = FocusNode();
    focusPass = FocusNode();
    focusMob = FocusNode();

  }

  Widget progressWidget() {
    if (_loading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }
  _showLoadingIndicator() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: <Widget>[
              CircularProgressIndicator(),
              SizedBox(
                width: 20.0,
              ),
              Text("Loading!")
            ],
          ),
        );
      },
    );
  }


  String validateMobile(String value) {
      if(value.length==0)
        {
          return "* Required";
        }
      return null;
  }
  String validateEmail(String value) {
     if(value.length==0)
       {
         return '* Required';
       }
     return null;
  }

  String validateName(String value){
     RegExp nameRegExp = RegExp('[a-zA-Z]');
      if(value.length==0)
        {
          return '* Required';
        }
      else if(!nameRegExp.hasMatch(value))
        return "Please Enter Valid Name";

  }
  void processError(final PlatformException error) {
    setState(() {
      _errorMessage = error.message;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    focusFname.dispose();
    focusLname.dispose();
    focusEmail.dispose();
    focusPass.dispose();
    focusMob.dispose();
  }
  void configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.yellow
      ..backgroundColor = Colors.green
      ..indicatorColor = Colors.yellow
      ..textColor = Colors.yellow
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = true;
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
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 100.0,
                    child: Image.asset(
                      "image/splash/img_splash_logo.jpg",
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 40.0),

                  TextFormField(
                    autofocus: true,
                    controller: fnameController,

                      validator: validateName,

                    onSaved: (String val) {

                      fname = val;
                    },
                    focusNode: focusFname,

                    onFieldSubmitted: (value) {
                      focusFname.unfocus();
                      FocusScope.of(context).requestFocus(focusLname);

                    },
                    style: TextStyle(
                        fontFamily: "Jaapokki",
                        fontSize: 16.0,
                        color: Colors.black),

//
                    decoration: new InputDecoration(
                      labelText: "First Name",
                      labelStyle: Resource.style.homeItemTitle3(),
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.person,color:Colors.black ),

                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black38, width: 5.0),
                        borderRadius: new BorderRadius.circular(32.0),
                      ),

                      //fillColor: Colors.green
                    ),
                    textInputAction: TextInputAction.next,
                    keyboardAppearance: Brightness.light,
                    keyboardType: TextInputType.text,

                  ),
                  // emailField,
                  SizedBox(height: 25.0),

                  TextFormField(
                    autofocus: true,
                    controller: lnameController,
                    validator: validateName,

                    onSaved: (String val) {

                      lname = val;
                    },
                    focusNode: focusLname,

                    onFieldSubmitted: (value) {
                      focusLname.unfocus();
                      FocusScope.of(context).requestFocus(focusEmail);

                    },
                    style: TextStyle(
                        fontFamily: "Jaapokki",
                        fontSize: 16.0,
                        color: Colors.black),

//
                    decoration: new InputDecoration(
                      labelText: "Last Name",
                      labelStyle: Resource.style.homeItemTitle3(),
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.person,color: Colors.black),

                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black38, width: 5.0),
                        borderRadius: new BorderRadius.circular(32.0),
                      ),

                      //fillColor: Colors.green
                    ),
                    textInputAction: TextInputAction.next,
                    keyboardAppearance: Brightness.light,
                    keyboardType: TextInputType.text,
                  ),
                  // emailField,
                  SizedBox(height: 25.0),


                  TextFormField(
                    autofocus: true,
                    validator: validateEmail,



                    controller: emailController,
                    onSaved: (String val) {

                      email = val;
                    },
                    focusNode: focusEmail,

                    onFieldSubmitted: (value) {
                      focusEmail.unfocus();
                      FocusScope.of(context).requestFocus(focusPass);

                    },
                    style: TextStyle(
                        fontFamily: "Jaapokki",
                        fontSize: 16.0,
                        color: Colors.black),

//
                    decoration: new InputDecoration(
                      labelText: "Email",
                      labelStyle: Resource.style.homeItemTitle3(),
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.email,color: Colors.black),

                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black38, width: 5.0),
                        borderRadius: new BorderRadius.circular(32.0),
                      ),

                      //fillColor: Colors.green
                    ),
                    textInputAction: TextInputAction.next,
                    keyboardAppearance: Brightness.light,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  // emailField,
                  SizedBox(height: 25.0),

                  TextFormField(
                    autofocus: true,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "* Required";
                      } else
                        return null;
                    },

                    controller: passwordController,
                    onSaved: (String val) {
                      password = val;
                    },
                    obscureText: !passVisible,
                    focusNode: focusPass,
                    onFieldSubmitted: (value) {
                      focusPass.unfocus();
                      FocusScope.of(context).requestFocus(focusMob);
                    },
                    style: TextStyle(
                        fontFamily: "Jaapokki",
                        fontSize: 16.0,
                        color: Colors.black),

                    decoration: new InputDecoration(
                      labelText: "Password",
                      labelStyle: Resource.style.homeItemTitle3(),
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.lock,color: Colors.black),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            passVisible = !passVisible;
                          });
                        },


                        child: passVisible == false ? Icon(Icons.visibility_off,color:Colors.black) : Icon(Icons.visibility,color:Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black38, width: 5.0),
                        borderRadius: new BorderRadius.circular(32.0),
                      ),    //fillColor: Colors.green
                    ),
                    textInputAction: TextInputAction.next,
                    keyboardAppearance: Brightness.light,
                    keyboardType: TextInputType.text,

                  ),
                  //  passwordField,
                  SizedBox(
                    height: 25.0,
                  ),

                  TextFormField(
                    autofocus: true,
                    validator: validateMobile,

                    controller: mobController,
                    onSaved: (String val) {

                      mob = val;
                    },
                    focusNode: focusMob,
                    style: TextStyle(
                        fontFamily: "Jaapokki",
                        fontSize: 16.0,
                        color: Colors.black),

//
                    decoration: new InputDecoration(
                      labelText: "Mobile Number",
                      labelStyle: Resource.style.homeItemTitle3(),
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.phone,color:Colors.black),

                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black38, width: 5.0),
                        borderRadius: new BorderRadius.circular(32.0),
                      ),     //fillColor: Colors.green
                    ),
                    textInputAction: TextInputAction.go,
                    keyboardAppearance: Brightness.light,
                    keyboardType: TextInputType.number,
                  ),
                  // emailField,
                  SizedBox(height: 35.0),


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
                      onPressed: () async{


                        //FirebaseUser user = await auth.googleSignIn();
                        if (_formKey.currentState.validate()) {
//                          _showLoadingIndicator();


                          FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                              email: emailController.text.trim(),
                              password: passwordController.text)
                              .then((authResult) => Firestore.instance
                              .collection("users")
                              .document(authResult.user.uid)
                              .setData({
                            "uid": authResult.user.uid,
                            "displayName": fnameController.text,
                            "lname": lnameController.text,
                            "email": emailController.text,
                            "mobile":mobController.text,

                          })

                              .then((result) => {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                                    (_) => false),
                          EasyLoading.dismiss(),
                            fnameController.clear(),
                            lnameController.clear(),
                            emailController.clear(),
                            passwordController.clear(),
                            mobController.clear(),

                            })).catchError((onError) {
                            processError(onError);
                          });



                        }
                        else{

                        }



                     },
                      child: Text(
                          "Sign Up",

                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '$_errorMessage',
                      style: TextStyle(fontSize: 14.0, color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  //  loginButon,
                  SizedBox(
                    height: 15.0,
                  ),

                  GestureDetector(

                    onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginScreen()),
                      );

                    },
                    child:  Text("Already have an Account? Login",
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14.0,decoration: TextDecoration.underline),
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
