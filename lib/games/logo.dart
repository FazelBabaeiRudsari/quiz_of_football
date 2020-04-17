import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:quizoffootball/helper/functions.dart';
import 'package:quizoffootball/model/user.dart';
import 'package:quizoffootball/model/vsgame.dart';

class Logo extends StatefulWidget {
  Logo(VSGame vsGame, User player1, List<dynamic> p1_status);

  @override
  _LogoState createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Functions.findGamer(context, {'game_id': '1'});
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
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    "images/avatars/boy-3.png",
                  ),
                  radius: MediaQuery.of(context).size.width / 8,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10.0)),
                  width: MediaQuery.of(context).size.width * 9 / 10,
                  height: MediaQuery.of(context).size.height * 3 / 4,
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(20.0)),
                          width: MediaQuery.of(context).size.width * 4 / 5,
                          height: MediaQuery.of(context).size.width * 4 / 5,
                          child: Image.asset(
                            "images/logo/11.jpg",
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 1 / 15,
                            right: MediaQuery.of(context).size.width * 1 / 60,
                            left: MediaQuery.of(context).size.width * 1 / 60,
                            bottom: MediaQuery.of(context).size.height * 1 / 20,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blue[600],
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20.0),
                                    bottomLeft: Radius.circular(20.0))),
                            padding: EdgeInsets.only(
//                              top: MediaQuery.of(context).size.height * 1 / 15,
//                              right: MediaQuery.of(context).size.width * 1 / 60,
//                              left: MediaQuery.of(context).size.width * 1 / 60,
//                              bottom: MediaQuery.of(context).size.height * 1 / 20,
                                ),
                            child: Row(
//                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
//                                    Padding(
//                                      padding: const EdgeInsets.all(3.0),
//                                      child:
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          7 /
                                          18,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              18,
                                      padding: EdgeInsets.all(3.0),
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          shape: BoxShape.rectangle,
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: Center(
                                        child: Text(
                                          "WestHam United",
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  24,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
//                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                7 /
                                                18,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                18,
                                        padding: EdgeInsets.all(3.0),
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        child: Center(
                                          child: Text(
                                            "Dunde United",
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    24,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                7 /
                                                18,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                18,
                                        padding: EdgeInsets.all(3.0),
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        child: Center(
                                          child: Text(
                                            "WolverHampton",
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    24,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                7 /
                                                18,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                18,
                                        padding: EdgeInsets.all(3.0),
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            shape: BoxShape.rectangle,
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        child: Center(
                                          child: Text(
                                            "I Don't Know",
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    24,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
//          )
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
