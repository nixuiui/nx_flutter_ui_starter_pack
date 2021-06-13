import 'package:flutter/material.dart';

class NxBox extends StatelessWidget {
  const NxBox({
    Key? key,
    this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.color = Colors.white,
    this.borderRadius,
    this.borderColor,
    this.boxShadow,
    this.image,
    this.onPressed,
    this.gradient
  }) : super(key: key);

  final Widget? child;
  final double? width;
  final double? height;
  final Color? color;
  final double? padding;
  final double? margin;
  final double? borderRadius;
  final Color? borderColor;
  final ImageProvider? image;
  final List<BoxShadow>? boxShadow;
  final VoidCallback? onPressed;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onPressed,
      child: Container(
        width: width ?? MediaQuery.of(context).size.width,
        height: height,
        padding: EdgeInsets.all(padding ?? 0),
        margin: EdgeInsets.all(margin ?? 0),
        child: child,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: borderColor ?? Colors.transparent, width: borderColor != null ? 1 : 0),
          boxShadow: boxShadow,
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
          image: image != null ? DecorationImage(image: image!, fit: BoxFit.cover) : null,
          gradient: gradient ?? null
        ),
      ),
    );
  }
}