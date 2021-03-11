import 'package:flutter/material.dart';
import 'package:foreverfit/core/widget/PureInkWell.dart';
import 'package:foreverfit/resource/resource.dart';

class SquareItemWithTitle1 extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  final Function onTap;
  final Function onTap1;

  SquareItemWithTitle1({
    @required this.title,
    @required this.subTitle,
    @required this.image,
    @required this.onTap,
    @required this.onTap1,
  });

  @override
  Widget build(BuildContext context) {
    return PureInkWell(
      onTap: this.onTap,
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              FittedBox(
                child: Image.asset(this.image),
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: FractionallySizedBox(
                  alignment: Alignment.bottomLeft,
                  widthFactor: 0.8,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                        color: Resource.color.mainColorLight,
                        borderRadius:
                        BorderRadius.only(topRight: Radius.circular(24))),
                    child: Column(
                      children: <Widget>[
                        Text(
                          title,
                          style: Resource.style.homeItemTitle(),
                        ),
                        Text(
                          subTitle,
                          style: Resource.style.homeItemContent(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
