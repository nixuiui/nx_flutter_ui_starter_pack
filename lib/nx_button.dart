import 'package:flutter/material.dart';
import 'package:nx_flutter_ui_starter_pack/nx_enum.dart';
import 'package:nx_flutter_ui_starter_pack/nx_loading_spinner.dart';

class NxButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double? width;
  final double? padding;
  final double? fontSize;
  final NxColor? defaultButtonColor;
  final Color? color;
  final Color? borderColor;
  final Color? iconColor;
  final Color? textColor;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final double? elevation;
  final double? radius;
  final bool isLoading;
  final Widget? child;

  const NxButton({
    Key? key,
    this.onPressed,
    this.width,
    this.padding,
    this.fontSize,
    this.defaultButtonColor,
    this.color = Colors.white,
    this.borderColor = Colors.white,
    this.iconColor = Colors.black54,
    this.textColor = Colors.black54,
    this.leftIcon,
    this.rightIcon,
    this.elevation = 0,
    this.radius,
    this.isLoading = false,
    this.child,
  }) : super(key: key);

  factory NxButton.primary({
    VoidCallback? onPressed,
    double? width,
    double? padding,
    double? fontSize,
    IconData? leftIcon,
    IconData? rightIcon,
    double? radius,
    bool? isLoading = false,
    Widget? child,
  }) => NxButton(
    onPressed: onPressed,
    width: width,
    padding: padding,
    fontSize: fontSize,
    leftIcon: leftIcon,
    rightIcon: rightIcon,
    defaultButtonColor: NxColor.primary,
    iconColor: Colors.white,
    radius: radius,
    isLoading: isLoading ?? false, 
    child: child, 
  );
  
  factory NxButton.accent({
    VoidCallback? onPressed,
    double? width,
    double? padding,
    double? fontSize,
    IconData? leftIcon,
    IconData? rightIcon,
    double? radius,
    bool isLoading = false,
    Widget? child,
  }) => NxButton(
    onPressed: onPressed,
    width: width,
    padding: padding,
    fontSize: fontSize,
    leftIcon: leftIcon,
    rightIcon: rightIcon,
    defaultButtonColor: NxColor.accent,
    iconColor: Colors.white,
    radius: radius,
    isLoading: isLoading,
    child: child,
  );

  @override
  Widget build(BuildContext context) {

    Color? fixButtonColor;
    if(defaultButtonColor == NxColor.primary)
      fixButtonColor = Theme.of(context).colorScheme.primary;
    else if(defaultButtonColor == NxColor.accent)
      fixButtonColor = Theme.of(context).colorScheme.secondary;
    
    Color? fixContentColor;
    if(defaultButtonColor == NxColor.primary)
      fixContentColor = Colors.white;
    else if(defaultButtonColor == NxColor.accent)
      fixContentColor = Colors.white;
    
    if(onPressed == null) 
      fixButtonColor = fixButtonColor?.withOpacity(0.5);

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
          backgroundColor: MaterialStateProperty.all(fixButtonColor ?? color)
        ),
        child: isLoading ? NxLoadingSpinner(
          size: fontSize != null ? fontSize! + 4 : 16
        ) : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            
            leftIcon != null ? Container(
              child: Icon(leftIcon, color: fixContentColor ?? iconColor, size: fontSize != null ? fontSize! + 4 : 16),
            ) : SizedBox.shrink(),

            if(child != null) child!,

            rightIcon != null ? Container(
              child: Icon(rightIcon, color: fixContentColor ?? iconColor, size: fontSize != null ? fontSize! + 4 : 16),
            ) : SizedBox.shrink(),

          ],
        ),
      ),
    );
  }
}