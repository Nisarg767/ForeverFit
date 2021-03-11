import 'package:flutter/material.dart';

class PureInkWell extends StatelessWidget {
  final Function onTap;
  final Widget child;

  PureInkWell({this.onTap, this.child});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onTap,
      child: this.child,
    );
  }
}
