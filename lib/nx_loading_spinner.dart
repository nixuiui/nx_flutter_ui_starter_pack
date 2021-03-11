import 'package:flutter/material.dart';

class NxLoadingSpinner extends StatelessWidget {
  const NxLoadingSpinner({
    Key key,
    this.color = Colors.white,
    this.size = 20
  }) : super(key: key);

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      child: Center(
          child: SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              strokeWidth: 1.5,
              backgroundColor: Theme.of(context).primaryColor,
              valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).accentColor),
            ),
          ),
        ),
    );
  }
}