import 'package:flutter/material.dart';

class NxImage extends StatelessWidget {
  final ImageProvider image;
  final double size;
  final double radius;
  final Color borderColor;
  final double borderSize;

  const NxImage({
    Key key,
    this.image,
    this.borderColor,
    this.borderSize,
    this.radius,
    this.size = 60
  }) : super(key: key);

  factory NxImage.avatar({
    ImageProvider image,
    double size,
    Color borderColor,
    double borderSize
  }) => NxImage(
    image: image,
    size: size,
    borderColor: borderColor,
    borderSize: borderSize,
    radius: 100,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: image != null ? Colors.white : Colors.grey,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: borderColor ?? Colors.transparent, 
          width: borderSize ?? 0
        ),
        image: image != null ? DecorationImage(
          fit: BoxFit.cover,
          image: image
        ) : null
      ),
    );
  }
}