import 'package:flutter/material.dart';
import 'package:foreverfit/resource/resource.dart';
import 'package:foreverfit/screen/home/childrend/exercises/back_page.dart';
class BackDetailPage extends StatelessWidget {
  final Back _healthTip;

  BackDetailPage(this._healthTip);

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Hero(
            tag: _healthTip.image2,
            child: FittedBox(child: Image.asset(_healthTip.image2)),
          ),
          SizedBox(height: Resource.space.xHuge),
          Text(
            _healthTip.title,
            style: Resource.style.homeItemTitle(),
          ),
          SizedBox(height: Resource.space.medium),
          Text(
            _healthTip.fakeContent,

            style: Resource.style.homeItemContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text("Back"),
      backgroundColor: Resource.color.mainColorDark,
      iconTheme: IconThemeData(color: Colors.white54),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
}
