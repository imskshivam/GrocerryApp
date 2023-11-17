import 'package:flutter/material.dart';

class customtext extends StatelessWidget {
  final String name;

  final double size;
  final Color color;
  final FontWeight fw;
  final double lspace;

  const customtext({
    super.key,
    required this.name,
    required this.size,
    this.color = Colors.black,
    required this.fw,
    required this.lspace,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "$name",
      style: TextStyle(
        fontFamily: 'Open Sans',
        color: color,
        fontWeight: fw,
        letterSpacing: lspace,
        fontSize: size,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}
