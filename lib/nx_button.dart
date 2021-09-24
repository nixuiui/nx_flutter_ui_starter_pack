import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nx_flutter_ui_starter_pack/nx_enum.dart';
import 'package:nx_flutter_ui_starter_pack/nx_loading_spinner.dart';

class NxButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final double? width;
  final double? padding;
  final double? fontSize;
  final NxColor? defaultButtonColor;
  final Color? color;
  final Color? borderColor;
  final Color? iconColor;
  final Color? textColor;
  final IconData? icon;
  final double? elevation;
  final double? radius;
  final bool isLoading;

  const NxButton({
    Key? key,
    this.text,
    this.onPressed,
    this.width,
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
    String? text,
    VoidCallback? onPressed,
    double? width,
    double? padding,
    double? fontSize,
    IconData? icon,
    double? radius,
    bool? isLoading = false
  }) => NxButton(
    onPressed: onPressed,
    width: width,
    padding: padding,
    fontSize: fontSize,
    icon: icon,
    text: text,
    defaultButtonColor: NxColor.primary,
    iconColor: Colors.white,
    radius: radius,
    isLoading: isLoading ?? false, 
  );
  
  factory NxButton.accent({
    String? text,
    VoidCallback? onPressed,
    double? width,
    double? padding,
    double? fontSize,
    IconData? icon,
    double? radius,
    bool isLoading = false
  }) => NxButton(
    onPressed: onPressed,
    width: width,
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

    Color? fixButtonColor;
    if(defaultButtonColor == NxColor.primary)
      fixButtonColor = Theme.of(context).primaryColor;
    else if(defaultButtonColor == NxColor.accent)
      fixButtonColor = Theme.of(context).accentColor;
    
    Color? fixContentColor;
    if(defaultButtonColor == NxColor.primary)
      fixContentColor = Colors.white;
    else if(defaultButtonColor == NxColor.accent)
      fixContentColor = Colors.white;

    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(elevation ?? 0),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 8),
            side: BorderSide(color: fixButtonColor ?? borderColor!, width: 1),
          )),
          padding: MaterialStateProperty.all(EdgeInsets.all(padding ?? 12)),
          textStyle: MaterialStateProperty.all(TextStyle(
            color: Colors.white,
          )),
          backgroundColor: MaterialStateProperty.all(fixButtonColor ?? color)
        ),
        child: isLoading ? NxLoadingSpinner(
          size: fontSize != null ? fontSize! + 4 : 16
        ) : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            icon != null ? Container(
              margin: EdgeInsets.only(right: text != null ? 8 : 0),
              child: Icon(icon, color: fixContentColor ?? iconColor, size: fontSize != null ? fontSize! + 4 : 16),
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