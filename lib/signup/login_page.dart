import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foreverfit/resource/resource.dart';
import 'package:foreverfit/screen/home/home_page.dart';
import 'package:foreverfit/signup/signup_page.dart';
//import 'package:toast/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:foreverfit/custom_alert_dialog.dart';
import 'package:foreverfit/forgot.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {


  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  bool showProgress = false;
  FocusNode focusEmail,focusPass;
  bool passVisible = false;
  String _errorMessage = '';
  String email,password;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _loading=false;
  bool isEnabled = true ;
  Future<void> _changeLoadingVisible() async {
    setState(() {
      _loading = !_loading;
    });
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

  void _showFormDialog() {
    var alert = AlertDialog(
      content: ListTile(
        subtitle: Form(
          child: TextFormField(
            autovalidate: true,
            controller: emailController,
            autocorrect: true,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.alternate_email, color: Colors.blueGrey),
              hintText: "Enter Your Email",
              labelText: "Email",
            ),
            // ignore: missing_return
            validator: (val) {
              String pattern =
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp = new RegExp(pattern);
              if (val.length == 0) {
                return "Email is required";
              } else if (!regExp.hasMatch(val)) {
                return "Invalid Email";
              } else {
                return null;
              }
            },
            onSaved: (val) {
              emailController.text = val;
            },
          ),
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            '$_errorMessage',
            style: TextStyle(fontSize: 14.0, color: Colors.red),
            textAlign: TextAlign.center,
          ),
        ),
        FlatButton(
          child: Text("Cancel"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text("Send"),
          onPressed: () async {
            if (validateEmail != null) {
              FirebaseAuth.instance.sendPasswordResetEmail(
                  email: emailController.text.trim());
              Navigator.of(context).pop();

            }
            else{

            }

          },
        ),
      ],
    );
    showDialog(context: context, builder: (_) => alert);
  }

  void processError(final PlatformException error) {
    setState(() {
      CircularProgressIndicatorApp();
      _errorMessage = error.message;
    });
  }
  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  bool isEmail(String em) {

    String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    focusEmail = FocusNode();
    focusPass = FocusNode();
    _loading=false;
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    focusEmail.dispose();
    focusPass.dispose();
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

                    height: 155.0,
                    child: Image.asset(

                      "image/splash/img_splash_logo.jpg",
                    ),
                  ),
                  SizedBox(height: 40.0),
                  TextFormField(
                    autofocus: true,
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
                      prefixIcon: Icon(Icons.email,color:Colors.black),
                       fillColor: Colors.black38,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black38, width: 5.0),
                        borderRadius: new BorderRadius.circular(32.0),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "* Required";
                      } else
                        return null;
                    },
                  ),
                  // emailField,
                  SizedBox(height: 25.0),

                  TextFormField(
                    autofocus: true,

                    controller: passwordController,
                    onSaved: (String val) {
                      password = val;
                    },
                    obscureText: !passVisible,
                    focusNode: focusPass,
                    style: TextStyle(
                        fontFamily: "Jaapokki",
                        fontSize: 16.0,
                        color: Colors.black),

                    decoration: new InputDecoration(
                      labelText: "Password",
                      labelStyle: Resource.style.homeItemTitle3(),

                      fillColor: Colors.black,
                      prefixIcon: Icon(Icons.lock,color:Colors.black),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            passVisible = !passVisible;


                          });
                        },


                        child: passVisible == false ? Icon(Icons.visibility_off,color: Colors.black,) : Icon(Icons.visibility,color: Colors.black,),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black38, width: 5.0),
                        borderRadius: new BorderRadius.circular(32.0),
                      ),
                      //fillColor: Colors.green
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "* Required";
                      } else
                        return null;
                    },


                  ),
                  //  passwordField,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      MaterialButton(
                          child: Text(
                            "Forgot Password",
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                .copyWith(color: Colors.black),
                          ),
                          onPressed: () {

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => paScreen()));

                          }),

                    ],

                  ),

                  SizedBox(
                    height: 35.0,
                  ),
                  _loading
                      ? Center(child: CircularProgressIndicator())


                  :Material(
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
                      //    CircularProgressIndicatorApp();
                       //   await _changeLoadingVisible();
                      /*    setState((){
                            _loading = true;
                          });*/ // set loading to true here
                          CircularProgressIndicator();
                          FirebaseAuth.instance
                             .signInWithEmailAndPassword(
                             email: emailController.text.trim(),
                             password: passwordController.text)
                             .then((authResult) =>
                             Firestore.instance
                                 .collection("users")
                                 .document(authResult.user.uid)
                                 .get()
                                 .then((DocumentSnapshot result) async =>

                                 Navigator.pushReplacement(
                                     context,
                                     MaterialPageRoute(
                                         builder: (context) => HomePage()))



                             ))
                         .catchError((onError) =>
                              processError(onError)).catchError((onError)=>_changeLoadingVisible());


                       }


                      },
                      child:Text("Login",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center
                      ),
                    ),
                  ),
                  //  loginButon,
                  SizedBox(
                    height: 15.0,
                  ),

                  GestureDetector(

                    onTap: () {

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => SignUpScreen()));

                    },
                    child:  Text("Create a new Account? Sign Up",
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14.0,decoration: TextDecoration.underline),
                        textAlign: TextAlign.center
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
class CircularProgressIndicatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      backgroundColor: Colors.red,
      strokeWidth: 8,);
  }
}


