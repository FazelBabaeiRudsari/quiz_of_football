import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:quizoffootball/helper/functions.dart';
import 'file:///D:/Save/Flutter/quiz_of_football/lib/model/user.dart';
import 'package:quizoffootball/model/user.dart';
import 'package:quizoffootball/model/vsgame.dart';

class GameDetails extends StatefulWidget {
  @override
  _GameDetailsState createState() => _GameDetailsState();
}

class _GameDetailsState extends State<GameDetails> {
  Future<VSGame> vsGame;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      vsGame = Functions.findGamer(context, {'game_id': '1'});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[600],
      body: Stack(
        children: <Widget>[
          ClipPath(
            child: Container(
              color: Colors.black54,
            ),
            clipper: TopClipper(),
          ),
          ClipPath(
            child: Container(
              color: Colors.black26,
            ),
            clipper: TopClipperTwo(),
          ),
          Column(
            children: <Widget>[
              Center(
                child: Text("30:00"),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Row(
                  children: <Widget>[
                    Column(children: <Widget>[
                      Text("hamed"),
                    ]),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class TopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height / 3);
    path.lineTo(size.width, size.height / 5);
    path.lineTo(size.width, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class TopClipperTwo extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(size.width / 2, 0.0);
    path.lineTo(size.width, size.height / 3);
    path.lineTo(size.width, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
