import 'package:flutter/material.dart';
import 'package:flutter_app_6_snake/Blank_pixel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int> SnakePos = [0,1,2];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(),
        ),
        Expanded(
          flex: 4,
          child: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 10),
            itemCount: 100,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Text(index.toString());
            },
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(),
        ),
      ],
    );
  }
}
