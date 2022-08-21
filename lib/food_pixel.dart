import 'package:flutter/material.dart';

class FoodPixel extends StatelessWidget {
  const FoodPixel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.5),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFe58d51),
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
      ),
    );
  }
}
