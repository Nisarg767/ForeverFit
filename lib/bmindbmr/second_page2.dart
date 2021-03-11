import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foreverfit/bmindbmr/buttons.dart';
import 'package:foreverfit/resource/resource.dart';
import 'package:foreverfit/screen/home/childrend/trainer/trainers_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:io' show Platform;
import 'package:foreverfit/bmindbmr//background_card.dart';
import 'package:foreverfit/bmindbmr/constants.dart';
enum ActivityLevel {
  level_0,
  level_1,
  level_2,
  level_3,
  level_4,
}

enum WeightGoal {
  lose,
  gain,
  keep,
}

class SecondPage2 extends StatefulWidget {
  final String bmrResult;
  final String bmiResult;
  final String resultText;
  final String interpretation;
  SecondPage2(
      {this.resultText, this.interpretation, this.bmiResult, this.bmrResult});

  @override
  _SecondPage2 createState() => _SecondPage2();
}

class _SecondPage2 extends State<SecondPage2> {
  ActivityLevel selectedLevel = ActivityLevel.level_0;
  WeightGoal selectedGoal = WeightGoal.keep;
  double endBMR;
  double finalBMR() {
    endBMR = 0;
    if (selectedLevel == ActivityLevel.level_0) {
      endBMR = 1.2 * double.parse(widget.bmrResult);
      if (selectedGoal == WeightGoal.lose) {
        return endBMR -= 250;
      } else if (selectedGoal == WeightGoal.gain) {
        return endBMR += 250;
      } else if (selectedGoal == WeightGoal.keep) {
        return endBMR;
      }
    } else if (selectedLevel == ActivityLevel.level_1) {
      endBMR = 1.35 * double.parse(widget.bmrResult);
      if (selectedGoal == WeightGoal.lose) {
        return endBMR -= 250;
      } else if (selectedGoal == WeightGoal.gain) {
        return endBMR += 250;
      } else if (selectedGoal == WeightGoal.keep) {
        return endBMR;
      }
    } else if (selectedLevel == ActivityLevel.level_2) {
      endBMR = 1.55 * double.parse(widget.bmrResult);
      if (selectedGoal == WeightGoal.lose) {
        return endBMR -= 250;
      } else if (selectedGoal == WeightGoal.gain) {
        return endBMR += 250;
      } else if (selectedGoal == WeightGoal.keep) {
        return endBMR;
      }
    } else if (selectedLevel == ActivityLevel.level_3) {
      endBMR = 1.75 * double.parse(widget.bmrResult);
      if (selectedGoal == WeightGoal.lose) {
        return endBMR -= 250;
      } else if (selectedGoal == WeightGoal.gain) {
        return endBMR += 250;
      } else if (selectedGoal == WeightGoal.keep) {
        return endBMR;
      }
    } else if (selectedLevel == ActivityLevel.level_4) {
      endBMR = 2.05 * double.parse(widget.bmrResult);
      if (selectedGoal == WeightGoal.lose) {
        return endBMR -= 250;
      } else if (selectedGoal == WeightGoal.gain) {
        return endBMR += 250;
      } else if (selectedGoal == WeightGoal.keep) {
        return endBMR;
      }
    } else
      return endBMR;
  }

  double returnedBMR;

  Widget _verticalSpace() {
    return SizedBox(
      height: 16,
    );
  }

  Widget _buildAccountInfoItem(String content, String title) {
    return Column(
      children: <Widget>[
        Text(
          content,
          style: Resource.style.homeItemTitle(),
        ),
        SizedBox(height: 6),
        Text(
          title,
          style: Resource.style.homeItemContent(),
        ),
      ],
    );
  }
  Widget _buildButton(String name) {
    return MaterialButton(
      onPressed: () {_launchURL2();},
      child: Text(name),
      color: Resource.color.mainColorLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }

  Widget _buildButton2(String name) {
    return MaterialButton(
      onPressed: () {
        launch("tel://9825985414");
      },
      child: Text(name),
      color: Resource.color.mainColorLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Icon(Icons.arrow_back),
                ),
              ),
              _verticalSpace(),
              IntrinsicHeight(
                child: Stack(
                  fit: StackFit.passthrough,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top:20,right: 40.0),
                     child: Text('Your BMI: ${widget.bmiResult}',
                        style: kResultsTitleTextStyle),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 150.0,top:0.0),
                      child: BackgroundCard(
                        color: (widget.resultText == 'Underweight' ||
                            widget.resultText == 'Overweight')
                            ? Color(0xFFFEEAEA)
                            : Color(0xFFE3FFEE),
                        childContainer: Container(
                          padding: EdgeInsets.all(10.0),
                          child: Center(
                            child: Text(
                              widget.resultText.toUpperCase(),
                              style: kResultsTextStyle.copyWith(
                                color: (widget.resultText == 'Underweight' ||
                                    widget.resultText == 'Overweight')
                                    ? Color(0xFFF95F49)
                                    : Color(0xFF48C67D),
                              ),

                              textAlign: TextAlign.center,
                            ),

                          ),
                        ),
                      ),
                    ),

                    FlatButton(
                        onPressed: () {
                          showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      left: 15.0,
                                      right: 15.0,
                                      bottom: 100.0,
                                    top:5.0,
                                      ),
                                  child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFEDE4FE),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25.0)),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            '< 18,5 – underweight',
                                            style: kInfoTextStyle,
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            '18,5 – 24,99 – normal',
                                            style: kInfoTextStyle,
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            '≥ 25,0 – overweight',
                                            style: kInfoTextStyle,
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      )),
                                );
                              });
                        },
                        ),




                  ],
                ),
              ),
              _verticalSpace(),

                        Padding(
                          padding: EdgeInsets.only(top:20.0),
                          child: BackgroundCard(
                            radius: 20.0,
                            color: Color(0xFFEDE4FE),
                            childContainer: Container(
                            child: Text(
                              widget.interpretation,
                              style: kBodyTextStyle,
                              textAlign: TextAlign.center,
                            ),
                          ),

                          ),
                        ),

              _verticalSpace(),
              Padding(
                  padding: EdgeInsets.only(top:20.0),
                  child: Container(

                    child: Text('Your activity level:',
                        style:
                        kResultsTitleTextStyle.copyWith(color: Colors.white)),
                  )),

              IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      _buildAccountInfoItem("4/5", "Ratings"),
                      Container(
                        width: 1,
                        color: Color(0xff2C2C2C),
                      ),
                      _buildAccountInfoItem("0", "Following"),
                      Container(
                        width: 1,
                        color: Color(0xff2C2C2C),
                      ),
                      _buildAccountInfoItem("5634", "Followers"),
                    ],
                  ),
                ),
              ),
              _verticalSpace(),
              Padding(
                padding: EdgeInsets.only(top: 10.0, right: 40.0),
                child: GestureDetector(
                  onTap: () => {
                    _launchURL()
                  },

                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: new Icon(
                      FontAwesomeIcons.facebookF,
                      color: Color(0xFF0084ff),
                    ),
                  ),
                ),


              ),
              Padding(
                padding: EdgeInsets.only(right: 40.0),
                child: GestureDetector(
                  onTap: () => {
                    _launchURL3()
                  },

                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: new Icon(
                      FontAwesomeIcons.instagram,
                      color: Color(0xFF0084ff),
                    ),
                  ),
                ),


              ),
              _verticalSpace(),
              Container(
                height: 1,
                color: Color(0xffE5E5E5),
              ),
              _verticalSpace(),
            ],
          ),
        ),
      ),
    );
  }

  _launchURL() async {
    const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURL2() async{
    String fbProtocolUrl;
    if (Platform.isIOS) {
      fbProtocolUrl = 'fb://profile/100006398973933';
    } else {
      fbProtocolUrl = 'fb://page/100006398973933';
    }

    String fallbackUrl = 'https://www.facebook.com/rushi.joshi.79025';

    try {
      bool launched = await launch(fbProtocolUrl, forceSafariVC: false);

      if (!launched) {
        await launch(fallbackUrl, forceSafariVC: false);
      }
    } catch (e) {
      await launch(fallbackUrl, forceSafariVC: false);
    }
  }
  _launchURL3() async{
    var url = 'https://www.instagram.com/<INSTAGRAM_PROFILE>/';

    if (await canLaunch(url)) {
      await launch(
        url,
        universalLinksOnly: true,
      );
    } else {
      throw 'There was a problem to open the url: $url';
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: _buildBody(),
    );
  }
}
