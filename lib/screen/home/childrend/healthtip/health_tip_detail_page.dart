import 'package:flutter/material.dart';
import 'package:foreverfit/resource/resource.dart';
import 'package:foreverfit/screen/home/childrend/healthtip/health_tip_page.dart';

class HealthTipDetailPage extends StatelessWidget {
  final HealthTip _healthTip;

  HealthTipDetailPage(this._healthTip);

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Hero(
            tag: _healthTip.image,
            child: FittedBox(child: Image.asset(_healthTip.image)),
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
      title: Text("Fitness tip"),
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
