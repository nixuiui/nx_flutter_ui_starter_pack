import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nx_flutter_ui_starter_pack/nx_enum.dart';
import 'package:nx_flutter_ui_starter_pack/nx_loading_spinner.dart';

class NxButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final double padding;
  final double fontSize;
  final NxColor defaultButtonColor;
  final Color color;
  final Color borderColor;
  final Color iconColor;
  final Color textColor;
  final IconData icon;
  final double elevation;
  final double radius;
  final bool isLoading;

  const NxButton({
    Key key,
    this.text,
    this.onPressed,
    this.padding,
    this.fontSize,
    this.defaultButtonColor,
    this.color = Colors.white,
    this.borderColor = Colors.white,
    this.iconColor = Colors.black54,
    this.textColor = Colors.black54,
    this.icon,
    this.elevation = 0,
    this.radius,
    this.isLoading = false
  }) : super(key: key);

  factory NxButton.primary({
    String text,
    Function onPressed,
    double padding,
    double fontSize,
    IconData icon,
    double radius,
    bool isLoading = false
  }) => NxButton(
    onPressed: onPressed,
    padding: padding,
    fontSize: fontSize,
    icon: icon,
    text: text,
    defaultButtonColor: NxColor.primary,
    iconColor: Colors.white,
    radius: radius,
    isLoading: isLoading
  );
  
  factory NxButton.accent({
    String text,
    Function onPressed,
    double padding,
    double fontSize,
    IconData icon,
    double radius,
    bool isLoading = false
  }) => NxButton(
    onPressed: onPressed,
    padding: padding,
    fontSize: fontSize,
    icon: icon,
    text: text,
    defaultButtonColor: NxColor.accent,
    iconColor: Colors.white,
    radius: radius,
    isLoading: isLoading
  );

  @override
  Widget build(BuildContext context) {

    Color fixButtonColor;
    if(defaultButtonColor == NxColor.primary)
      fixButtonColor = Theme.of(context).primaryColor;
    else if(defaultButtonColor == NxColor.accent)
      fixButtonColor = Theme.of(context).accentColor;
    
    Color fixContentColor;
    if(defaultButtonColor == NxColor.primary)
      fixContentColor = Colors.white;
    else if(defaultButtonColor == NxColor.accent)
      fixContentColor = Colors.white;

    return Container(
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
        onPressed: isLoading ? null : onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 8),
          side: BorderSide(color: fixButtonColor ?? borderColor, width: 1),
        ),
        disabledElevation: 0,
        padding: EdgeInsets.all(padding ?? 12),
        disabledColor: Colors.grey[300],
        disabledTextColor: Colors.white,
        color: fixButtonColor ?? color,
        textColor: Colors.white,
        elevation: elevation,
        hoverElevation: elevation,
        focusElevation: elevation,
        highlightElevation: elevation,
        child: isLoading ? NxLoadingSpinner(
          size: fontSize != null ? fontSize + 4 : 16
        ) : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            icon != null ? Container(
              margin: EdgeInsets.only(right: text != null ? 8 : 0),
              child: Icon(icon, color: fixContentColor ?? iconColor, size: fontSize != null ? fontSize + 4 : 16),
            ) : Container(height: 0),
            Text(
              text ?? "", 
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: fontSize ?? 16,
                color: fixContentColor ?? textColor
              )
            ),
          ],
        ),
      ),
    );
  }
}