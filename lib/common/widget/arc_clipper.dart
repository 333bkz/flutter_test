import 'package:flutter/material.dart';

class ArcClipper extends CustomClipper<Path> {
  final double factor;

  ArcClipper({this.factor = 0.618});

  @override
  Path getClip(Size size) => Path()
    ..moveTo(0, 0)
    ..relativeLineTo(size.width, 0)
    ..relativeLineTo(0, 0.8 * size.height)
    ..arcToPoint(
      Offset(0.0, size.height * 0.618),
      radius: const Radius.elliptical(50.0, 10.0),
      rotation: 0.0,
    )
    ..close();

  @override
  bool shouldReclip(ArcClipper oldClipper) => factor != oldClipper.factor;
}

///圆弧背景
class ArcBackground extends StatelessWidget {
  final Widget? child;
  final ImageProvider image;

  const ArcBackground({Key? key, this.child, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ArcClipper(),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: image,
            fit: BoxFit.cover,
          ),
        ),
        child: child,
      ),
    );
  }
}
