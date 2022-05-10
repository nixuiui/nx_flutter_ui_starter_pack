import 'package:flutter/material.dart';
import 'package:nx_flutter_ui_starter_pack/nx_flutter_ui_starter_pack.dart';

// Montserrat Typography Base On "Alceo - Sirka Design Library"
// Url https://www.figma.com/file/TZCJW5A2kTVNSNYNoGxeSX/Alceo---Sirka-Design-Library---Mobile-Devices?node-id=5180%3A3114

class NxText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final double? lineHeight;
  final int? maxLines;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final Function? onPressed;
  final NxColor? defaultColor;
  final TextDecoration? decoration;
  final TextOverflow? overflow;

  const NxText(this.text, {
    Key? key,
    this.color = Colors.black87,
    this.fontSize = 14,
    this.lineHeight = 1,
    this.maxLines,
    this.textAlign = TextAlign.left,
    this.fontWeight = FontWeight.normal,
    this.onPressed,
    this.defaultColor,
    this.decoration = TextDecoration.none,
    this.overflow,
  }) : super(key: key);

  factory NxText.heroTitle(String text, {
    int? maxLines,
    TextOverflow? overflow,
    TextAlign? textAlign,
    Color? color,
    double? lineHeight,
    Function? onPressed
  }) => NxText(
    text,
    maxLines: maxLines = 20,
    overflow: overflow,
    textAlign: textAlign,
    color: color,
    fontSize: 42,
    fontWeight: FontWeight.w600,
    onPressed: onPressed,
    lineHeight: 1.5,
  );
  
  factory NxText.headline1(String text, {
    int? maxLines,
    TextOverflow? overflow,
    TextAlign? textAlign,
    Color? color,
    double? lineHeight,
    Function? onPressed
  }) => NxText(
    text,
    maxLines: maxLines,
    overflow: overflow,
    textAlign: textAlign,
    color: color,
    fontSize: 36,
    fontWeight: FontWeight.w700,
    onPressed: onPressed,
    lineHeight: 1.25,
  );
  
  factory NxText.headline2(String text, {
    int? maxLines,
    TextOverflow? overflow,
    TextAlign? textAlign,
    Color? color,
    double? lineHeight,
    Function? onPressed
  }) => NxText(
    text,
    maxLines: maxLines,
    overflow: overflow,
    textAlign: textAlign,
    color: color,
    fontSize: 28,
    fontWeight: FontWeight.w700,
    onPressed: onPressed,
    lineHeight: 1.25,
  );
  
  factory NxText.headline3(String text, {
    int? maxLines,
    TextOverflow? overflow,
    TextAlign? textAlign,
    Color? color,
    double? lineHeight,
    Function? onPressed
  }) => NxText(
    text,
    maxLines: maxLines,
    overflow: overflow,
    textAlign: textAlign,
    color: color,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    onPressed: onPressed,
    lineHeight: 1.25,
  );
  
  factory NxText.headline4(String text, {
    int? maxLines,
    TextOverflow? overflow,
    TextAlign? textAlign,
    Color? color,
    double? lineHeight,
    Function? onPressed
  }) => NxText(
    text,
    maxLines: maxLines,
    overflow: overflow,
    textAlign: textAlign,
    color: color,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    onPressed: onPressed,
    lineHeight: 1.25,
  );
  
  factory NxText.headline5(String text, {
    int? maxLines,
    TextOverflow? overflow,
    TextAlign? textAlign,
    Color? color,
    double? lineHeight,
    Function? onPressed
  }) => NxText(
    text,
    maxLines: maxLines,
    overflow: overflow,
    textAlign: textAlign,
    color: color,
    fontSize: 16,
    fontWeight: FontWeight.w700,
    onPressed: onPressed,
    lineHeight: 1.5,
  );
  
  factory NxText.headline6(String text, {
    int? maxLines,
    TextOverflow? overflow,
    TextAlign? textAlign,
    Color? color,
    double? lineHeight,
    Function? onPressed
  }) => NxText(
    text,
    maxLines: maxLines,
    overflow: overflow,
    textAlign: textAlign,
    color: color,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    onPressed: onPressed,
    lineHeight: 1.5,
  );
  
  factory NxText.lead1(String text, {
    int? maxLines,
    TextOverflow? overflow,
    TextAlign? textAlign,
    Color? color,
    double? lineHeight,
    Function? onPressed
  }) => NxText(
    text,
    maxLines: maxLines,
    overflow: overflow,
    textAlign: textAlign,
    color: color,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    onPressed: onPressed,
    lineHeight: 1.5,
  );
  
  factory NxText.lead2(String text, {
    int? maxLines,
    TextOverflow? overflow,
    TextAlign? textAlign,
    Color? color,
    double? lineHeight,
    Function? onPressed
  }) => NxText(
    text,
    maxLines: maxLines,
    overflow: overflow,
    textAlign: textAlign,
    color: color,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    onPressed: onPressed,
    lineHeight: 1.5,
  );
  
  factory NxText.title(String text, {
    int? maxLines,
    TextOverflow? overflow,
    TextAlign? textAlign,
    Color? color,
    double? lineHeight,
    Function? onPressed
  }) => NxText(
    text,
    maxLines: maxLines,
    overflow: overflow,
    textAlign: textAlign,
    color: color,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    onPressed: onPressed,
    lineHeight: 1.5
  );
  
  factory NxText.subtitle(String text, {
    int? maxLines,
    TextOverflow? overflow,
    TextAlign? textAlign,
    Color? color,
    double? lineHeight,
    Function? onPressed
  }) => NxText(
    text,
    maxLines: maxLines,
    overflow: overflow,
    textAlign: textAlign,
    color: color,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    onPressed: onPressed,
    lineHeight: 1.5,
  );
  
  factory NxText.body1(String text, {
    int? maxLines,
    TextOverflow? overflow,
    TextAlign? textAlign,
    Color? color,
    double? lineHeight,
    Function? onPressed
  }) => NxText(
    text,
    maxLines: maxLines,
    overflow: overflow,
    textAlign: textAlign,
    color: color,
    fontSize: 14,
    fontWeight: FontWeight.w300,
    onPressed: onPressed,
    lineHeight: 1.5,
  );
  
  factory NxText.body2(String text, {
    int? maxLines,
    TextOverflow? overflow,
    TextAlign? textAlign,
    Color? color,
    double? lineHeight,
    Function? onPressed
  }) => NxText(
    text,
    maxLines: maxLines,
    overflow: overflow,
    textAlign: textAlign,
    color: color,
    fontSize: 12,
    fontWeight: FontWeight.w300,
    onPressed: onPressed,
    lineHeight: 1.5,
  );
  
  factory NxText.small1(String text, {
    int? maxLines,
    TextOverflow? overflow,
    TextAlign? textAlign,
    Color? color,
    double? lineHeight,
    Function? onPressed
  }) => NxText(
    text,
    maxLines: maxLines,
    overflow: overflow,
    textAlign: textAlign,
    color: color,
    fontSize: 10,
    fontWeight: FontWeight.w400,
    onPressed: onPressed,
    lineHeight: 1.5,
  );
  
  factory NxText.small2(String text, {
    int? maxLines,
    TextOverflow? overflow,
    TextAlign? textAlign,
    Color? color,
    double? lineHeight,
    Function? onPressed
  }) => NxText(
    text,
    maxLines: maxLines,
    overflow: overflow,
    textAlign: textAlign,
    color: color,
    fontSize: 8,
    fontWeight: FontWeight.w400,
    onPressed: onPressed,
    lineHeight: 1.5,
  );

  factory NxText.primary(String text, {
    int? maxLines,
    TextOverflow? overflow,
    TextAlign? textAlign,
    double? lineHeight,
    Function? onPressed
  }) => NxText(
    text,
    maxLines: maxLines,
    overflow: overflow,
    textAlign: textAlign,
    fontSize: 14,
    fontWeight: FontWeight.w300,
    onPressed: onPressed,
    lineHeight: 1.5,
    defaultColor: NxColor.primary,
  );

  factory NxText.error(String text, {
    int? maxLines,
    TextOverflow? overflow,
    TextAlign? textAlign,
    double? lineHeight,
    Function? onPressed
  }) => NxText(
    text,
    maxLines: maxLines,
    overflow: overflow,
    textAlign: textAlign,
    fontSize: 14,
    fontWeight: FontWeight.w300,
    onPressed: onPressed,
    lineHeight: 1.5,
    defaultColor: NxColor.error,
  );

  @override
  Widget build(BuildContext context) {

    Color? fixColor;
    if(defaultColor == NxColor.primary)
      fixColor = Theme.of(context).primaryColor;
    else if(defaultColor == NxColor.accent)
      fixColor = Theme.of(context).colorScheme.secondary;
    else if(defaultColor == NxColor.error)
      fixColor = Theme.of(context).colorScheme.error;

    return onPressed != null ? GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => onPressed?.call(),
      child: Text(
        text,
        maxLines: maxLines ?? DefaultTextStyle.of(context).maxLines,
        overflow: overflow,
        textAlign: textAlign,
        style: TextStyle(
          height: lineHeight,
          color: fixColor ?? color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          decoration: decoration,
          overflow: overflow,
        ),
      ),
    ) : Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: TextStyle(
        height: lineHeight,
        color: fixColor ?? color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: decoration,
        overflow: overflow,
      ),
    );
  }
}