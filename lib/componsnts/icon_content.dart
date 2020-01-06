import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color labelColor;

  IconContent({
    @required this.icon,
    @required this.label,
    @required this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 18.0,
            color: labelColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
