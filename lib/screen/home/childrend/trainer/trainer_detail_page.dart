/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foreverfit/bmindbmr/buttons.dart';
import 'package:foreverfit/resource/resource.dart';
import 'package:foreverfit/screen/home/childrend/trainer/trainers_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:io' show Platform;
class TrainerDetailPage extends StatefulWidget {
  final Trainer _trainer;

  TrainerDetailPage(this._trainer);

  @override
  _TrainerDetailPageState createState() => _TrainerDetailPageState();
}

class _TrainerDetailPageState extends State<TrainerDetailPage> {
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

  Widget _buildInfoItem(InfoPair info) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xffD4D4D4)),
      ),
      child: Column(
        children: <Widget>[
          Text(
            info.title,
            style: Resource.style.homeItemTitle(),
          ),
          SizedBox(height: 6),
          Text(
            info.detail,
            style: Resource.style.homeItemContent(),
          ),
        ],
      ),
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
                    FittedBox(
                      fit: BoxFit.fill,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(minWidth: 100, minHeight: 100), // here
                        child: Image.asset(
                          Resource.image.rushi,
                        ),
                      ),
                    ),

                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: 4),
                              Text(
                                widget._trainer.name,
                                style:
                                    Resource.style.homeItemTitle5(fontSize: 18),
                              ),
                              SizedBox(height: 4),
                              Text(
                                widget._trainer.description,
                                style: Resource.style
                                    .homeItemTitle6(fontSize: 16),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(child:
                              _buildButton("Follow"),


                              ),
                             SizedBox(width: 12),
                              Expanded(child:
                              _buildButton2("Contact"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              _verticalSpace(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    size: 16,
                  ),
                  Text(
                    widget._trainer.location,
                    style: Resource.style.homeItemContent(),
                  )
                ],
              ),
              _verticalSpace(),
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

/*              Padding(
                padding: EdgeInsets.only(top: 10.0, right: 40.0),
                child: GestureDetector(
                  onTap: () => {
                    _launchURL2()
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
                padding: EdgeInsets.all(12),
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


              ),*/
              Padding(
                padding:EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: GestureDetector(
                        onTap: () => {
                          _launchURL2()
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
                    SizedBox(width:2),
                    Padding(

                      padding: EdgeInsets.all(12),
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
                    SizedBox(width:2),
                    Padding(

                      padding: EdgeInsets.all(12),
                      child: GestureDetector(
                        onTap: () => {
                          _launchURL4()
                        },

                        child: Container(
                          padding: const EdgeInsets.all(15.0),
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: new Icon(
                            FontAwesomeIcons.twitter,
                            color: Color(0xFF0084ff),
                          ),
                        ),
                      ),


                    ),

                  ],
                ),
              ),
              _verticalSpace(),
              Container(
                height: 1,
                color: Color(0xffE5E5E5),
              ),
              _verticalSpace(),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) => _buildInfoItem(infoPairs[index]),
                itemCount: infoPairs.length,
              )
            ],
          ),
        ),
      ),
    );
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
  var url = 'https://instagram.com/mr.joshi002?igshid=1w7k4inlipbv4';

  if (await canLaunch(url)) {
    await launch(
      url,
      universalLinksOnly: true,
    );
  } else {
    throw 'There was a problem to open the url: $url';
  }

}

  _launchURL4() async{
    var url = 'https://twitter.com/Rushi2219?s=09';

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

class InfoPair {
  final String title;
  final String detail;

  InfoPair({@required this.title, @required this.detail});
}

final infoPairs = [
  InfoPair(
    title: "Certifications",
    detail: "Advance Trainer Certification ISSA",
  ),
  InfoPair(
    title: "Awards",
    detail: "Best in Muscle Building",
  ),
  InfoPair(
    title: "Personal Training Client and Feedback",
    detail: "Strict, Calm in Nature",
  ),
];
*/