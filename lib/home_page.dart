import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;
  late Animation<double> sitleanimation;
  late Animation<double> roudanimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
    roudanimation = Tween(begin: 0.15, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.0, 0.5, curve: Curves.bounceIn)))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.repeat();
        }
      });
    sitleanimation = Tween(begin: 100.0, end: 600.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.0, 1.0, curve: Curves.fastOutSlowIn)))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.repeat();
        }
      });
    ;
    animation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn)))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.repeat();
        }
      });
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("UI")),
      body: AnimatedBuilder(
        animation: sitleanimation,
        builder: (context, child) => Container(
          width: 230,
          height: 100,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(left: 75, top: sitleanimation.value),
          child: RotationTransition(
            turns: roudanimation,
            child: Center(
              child: Text(
                "Ravshan",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(0, 0, 128, animation.value)),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          animationController.forward();
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
