import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foreverfit/resource/resource.dart';
import 'package:foreverfit/signup/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
class paScreen extends StatefulWidget {
  @override
  _paScreenState createState() => _paScreenState();
}


class _paScreenState extends State<paScreen> {

  FirebaseUser currentUser;
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


    void processError(final PlatformException error) {
    setState(() {
      _errorMessage = error.message;

    });
  }

  String email2() {
    if (currentUser != null) {
      return currentUser.email;
    } else {
      return "Guest User";
    }
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
                    autovalidate: true,
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
                    validator: validateEmail
                  ),
                  // emailField,
                  SizedBox(height: 25.0),


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
                          CircularProgressIndicator();
                          FirebaseAuth.instance.sendPasswordResetEmail(
                              email: emailController.text.trim())


                        .catchError((onError) =>
                              processError(onError)).catchError((onError)=>_changeLoadingVisible());
//                          Navigator.pop(context);
                          passwordResetDialog();



                        }


                      },
                      child:Text("Reset Password",
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
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => LoginScreen()));

                      },
                      child:Text("Cancel",
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
  void passwordResetDialog() {
   // user must tap but
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen()));

        },
    );

    var alert = AlertDialog(

      content: Text(
          "Password Reset Link Has Been Sent Successfully!"),
      actions: [
        okButton,
      ],



    );
    showDialog(context: context, builder: (_) => alert);
  }


}

