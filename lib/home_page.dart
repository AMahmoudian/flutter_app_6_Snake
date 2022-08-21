
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_6_snake/Blank_pixel.dart';
import 'package:flutter_app_6_snake/food_pixel.dart';
import 'package:flutter_app_6_snake/snake_pixel.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

enum SnakeDirection { Up, Down, Left, Right }

class _HomePageState extends State<HomePage> {

  List<int> SnakePos = [0, 1, 2];

  int FoodPos = 55;

  var CurrentDirection = SnakeDirection.Up;

  void StarGame() {
    Timer.periodic(Duration(milliseconds: 200), (timer) {
      setState(() {
        SnakePos.add(SnakePos.last + 1);
        SnakePos.removeAt(0);
      });
    });
  }

  void MoveSnake(){

    switch(CurrentDirection) {
      case SnakeDirection.Right:
        SnakePos.add(SnakePos.last + 1);
        SnakePos.removeAt(0);
        break;
      case SnakeDirection.Left:
        SnakePos.add(SnakePos.last - 1);
        SnakePos.removeAt(0);
        break;
      case SnakeDirection.Up:
        SnakePos.add(SnakePos.last - 10);
        SnakePos.removeAt(0);
        break;
      case SnakeDirection.Down:
        SnakePos.add(SnakePos.last + 10);
        SnakePos.removeAt(0);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(),
        ),
        Expanded(
          flex: 4,
          child: GestureDetector(
            onVerticalDragUpdate: (details) {
              if (details.delta.dy > 0) {
                CurrentDirection = SnakeDirection.Down;
              } else if (details.delta.dy < 0) {
                CurrentDirection = SnakeDirection.Up;
              }
            },
            onHorizontalDragUpdate: (details) {
              if (details.delta.dx > 0) {
                CurrentDirection = SnakeDirection.Right;
              } else if (details.delta.dx < 0) {
                CurrentDirection = SnakeDirection.Left;
              }
            },
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 10),
              itemCount: 100,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                if (SnakePos.contains(index)) {
                  return const SnakePixel();
                } else if (FoodPos == index) {
                  return FoodPixel();
                } else {
                  return BlankPixel();
                }
              },
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Container(
              child: MaterialButton(
                height: 60,
                minWidth: 150,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Text(
                  'Play',
                  style: TextStyle(fontSize: 25),
                ),
                color: Colors.pink,
                onPressed: () {
                  StarGame();
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
