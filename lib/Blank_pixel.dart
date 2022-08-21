import 'package:flutter/material.dart';

class BlankPixel extends StatelessWidget {
  const BlankPixel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.5),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(200, 200, 200, 0.6),
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
      ),
    );
  }
}
