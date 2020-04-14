import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:quizoffootball/customs/dimens.dart';
import 'package:quizoffootball/customs/theme.dart';
import 'package:quizoffootball/helper/functions.dart';
import 'package:quizoffootball/model/user.dart';

class GameStatus extends StatefulWidget {
  @override
  _GameStatusState createState() => _GameStatusState();
}

class _GameStatusState extends State<GameStatus> {
  User me;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: Stack(
        children: <Widget>[
          ClipPath(
            child: Container(color: MyColors.TopClipper),
            clipper: TopClipper(),
          ),
          ClipPath(
            child: Container(color: MyColors.TopClipperTwo),
            clipper: TopClipperTwo(),
          ),
          RefreshIndicator(
            onRefresh: () => _refreshData(1),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Container(
                      decoration: BoxDecoration(
//                        color: Colors.,
                          color: MyColors.primaryButton,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10.0)),
                      width: double.infinity,
                      height: Dimens.avatarRadius * 2,
//                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Stack(
                        children: <Widget>[
                          ClipPath(
                            child: Container(color: MyColors.TopClipperThree),
                            clipper: TopClipperThree(),
                          ),
                          ClipPath(
                            child: Container(color: MyColors.TopClipperFour),
                            clipper: TopClipperFour(),
                          ),
                          FutureBuilder<User>(
                            future: Functions.getUser(context, {"id": "-1"}),
                            builder: (BuildContext context,
                                AsyncSnapshot<User> snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.none:
                                  return Text(
                                    "connection none",
                                    style: TextStyle(color: Colors.white),
                                  );
                                case ConnectionState.waiting:
                                  return Center(
                                      child: CircularProgressIndicator());
                                case ConnectionState.active:
                                  return Center(child: Text("active"));
                                  break;
                                case ConnectionState.done:
                                  // TODO: Handle this case.
                                  break;
                              }
                              if (snapshot.hasError) {
                                print(snapshot.error);
                                return Center(
                                  child: Text("Somethings goes wrong!"),
                                );
                              } else if (snapshot.hasData) {
                                me = snapshot.data;

                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(me.username,
                                          style: MyStyles.profileTextStyle),
                                      me.img == null
                                          ? CircleAvatar(
                                              child: Image.asset(
                                                  "images/avatars/boy.png"),
                                              backgroundColor:
                                                  MyColors.avatarBackground,
                                              radius: Dimens.avatarRadius,
                                            )
                                          : CircleAvatar(
                                              backgroundImage:
                                                  AdvancedNetworkImage(me.img),
                                              radius: 20.0,
                                            ),
//                                    : AdvancedNetworkImage(me.img),
                                      Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: MyColors.level),
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Text(
                                            Functions.getLevel(me.score),
                                            style: MyStyles.profileTextStyle,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            },
                          ),
                        ],
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> _refreshData(int page) async {
    print("refreshdata");
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

class TopClipperThree extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height * 19 / 20);
    path.lineTo(size.width, size.height / 5);
    path.lineTo(size.width, 0.0);
    path.lineTo(0.0, size.height * 1 / 50);

//    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class TopClipperFour extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(size.width / 2, 0.0);
    path.lineTo(size.width, size.height * 3 / 4);
    path.lineTo(size.width, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
