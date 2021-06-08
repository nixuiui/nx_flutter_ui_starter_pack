import 'package:flutter/material.dart';
import 'package:nx_flutter_ui_starter_pack/nx_enum.dart';

class NxText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final int? maxLines;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final Function? onPressed;
  final NxColor? defaultColor;

  const NxText(this.text, {
    Key? key,
    this.color = Colors.black87,
    this.fontSize = 14,
    this.maxLines = 3,
    this.textAlign = TextAlign.left,
    this.fontWeight = FontWeight.normal,
    this.onPressed,
    this.defaultColor
  }) : super(key: key);

  factory NxText.title(String text, {
    int? maxLines,
    TextAlign? textAlign,
    Color? color,
    Function? onPressed
  }) => NxText(
    text,
    maxLines: maxLines,
    textAlign: textAlign,
    color: color,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    onPressed: onPressed,
  );
  
  factory NxText.subtitle(String text,{
    int? maxLines,
    TextAlign? textAlign,
    Color? color,
    Function? onPressed
  }) => NxText(
    text,
    maxLines: maxLines,
    textAlign: textAlign,
    color: color,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    onPressed: onPressed,
  );
  
  factory NxText.primary(String text, {
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    Function? onPressed
  }) => NxText(
    text,
    fontSize: fontSize,
    fontWeight: fontWeight,
    defaultColor: NxColor.primary,
    onPressed: onPressed,
  );
  
  factory NxText.accent(String text, {
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    Function? onPressed
  }) => NxText(
    text,
    fontSize: fontSize,
    fontWeight: fontWeight,
    defaultColor: NxColor.accent,
    onPressed: onPressed,
  );
  
  factory NxText.error(String text, {
    double fontSize = 12,
    FontWeight? fontWeight,
    Color? color,
  }) => NxText(
    text,
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: Colors.red
  );
  
  factory NxText.bold(String text, {
    Color? color,
    Function? onPressed
  }) => NxText(
    text,
    color: color,
    fontWeight: FontWeight.w600,
    onPressed: onPressed,
  );
  
  factory NxText.small(String text, {
    Color? color,
    Function? onPressed
  }) => NxText(
    text,
    fontSize: 12,
    color: color,
    onPressed: onPressed,
  );

  factory NxText.formLabel(String text) => NxText(
    text,
    fontSize: 12,
  );
  
  factory NxText.formHint(String text) => NxText(
    text,
    fontSize: 12,
    color: Colors.grey[700],
  );

  @override
  Widget build(BuildContext context) {

    Color? fixColor;
    if(defaultColor == NxColor.primary)
      fixColor = Theme.of(context).primaryColor;
    else if(defaultColor == NxColor.accent)
      fixColor = Theme.of(context).accentColor;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onPressed?.call(),
      child: Text(
        text,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign,
        style: TextStyle(
          color: fixColor ?? color,
          fontSize: fontSize,
          fontWeight: fontWeight
        ),
      ),
    );
  }
}