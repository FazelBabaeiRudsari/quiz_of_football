import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:quizoffootball/customs/VSGameBloc.dart';
import 'package:quizoffootball/customs/dimens.dart';
import 'package:quizoffootball/customs/loaders.dart';
import 'package:quizoffootball/customs/theme.dart';
import 'package:quizoffootball/helper/functions.dart';
import 'package:quizoffootball/model/user.dart';
import 'package:quizoffootball/model/vsgame.dart';
import 'package:quizoffootball/ui/gamedetails.dart';

class GameStatus extends StatefulWidget {
  @override
  _GameStatusState createState() => _GameStatusState();
}

class _GameStatusState extends State<GameStatus> {
  User me;

  VSGameBloc _bloc;

  List<VSGame> vsGames = List<VSGame>();
  Future<User> user;

  @override
  void initState() {
    _bloc ??= VSGameBloc();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _refreshData();
    });
    super.initState();
  }

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
            onRefresh: () => _refreshData(),
            child: Stack(
              children: <Widget>[
                // user profile widget
                SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      //find active vs games
                      Container(
                        width: double.infinity,
                        child: StreamBuilder(
                          stream: _bloc.stream,
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.none:
                                return Text(
                                  "Disconnected",
                                  style: TextStyle(color: Colors.white),
                                );
                              case ConnectionState.waiting:
                                return Center(child: Loader());
                              case ConnectionState.done:
                                return Text(
                                  'Done',
                                  style: TextStyle(color: Colors.white),
                                );
                              case ConnectionState.active:
//            print(snapshot.data);
                                if (snapshot.hasError || !snapshot.hasData) {
                                  return Container(
                                      child: Center(
                                          child: IconButton(
                                    padding: EdgeInsets.all(10.0),
                                    iconSize:
                                        MediaQuery.of(context).size.width / 10,
                                    icon: Icon(
                                      Icons.refresh,
                                      color: Colors.white70,
                                    ),
                                    onPressed: () {
                                      _refreshData();
                                    },
                                  )));
                                } else {
                                  // streamController.sink.add(snapshot.data.length);
                                  // if(snapshot.data.length==0) return;R
                                  //  print(snapshot.data[0].id);
                                  vsGames.addAll(snapshot.data);
                                  snapshot.data.clear();
                                  print(vsGames.length);
                                  return Container(
                                    margin: EdgeInsets.only(top: 300.0),
//                              height: 200.0,
                                    color: Colors.white,
                                    child: Column(
                                      children: gameRows(vsGames),

//                                  ListView.builder(
//                                    controller: null,
//                                    itemCount: vsGames.length,
//                                    itemBuilder:
//                                        (BuildContext context, int index) {
//                                      // if (index ==
//                                      //         wallpapers
//                                      //             .length /*&&
//                                      //     Variable.TOTAL_WALLPAPERS > wallpapers.length*/
//                                      //     ) return CupertinoActivityIndicator();
//                                      return _vsGamesRow(
//                                          context, vsGames[index]);
//                                    },
//                                  ),
//
                                    ),
                                  );
                                }

                                break;
                              default:
                                return Text('');
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(
                            top: 50.0, left: 20.0, right: 20.0, bottom: 50.0),
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
                                                    AdvancedNetworkImage(
                                                        me.img),
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
                    Container(
//                      padding: EdgeInsets.all(300.0),
                      child: Row(
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Text("Find Player"),
                            onTap: _findPlayer(),
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Text("League"),
                            onTap: _findLeague(),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                // find user and league buttons

//                Container(
//                  padding: EdgeInsets.all(300.0),
//                  child: Row(
//                    children: [
//                      InkWell(
//                        borderRadius: BorderRadius.circular(8.0),
//                        child: Text("Find Player"),
//                        onTap: _findPlayer(),
//                      ),
//                      InkWell(
//                        borderRadius: BorderRadius.circular(8.0),
//                        child: Text("League"),
//                        onTap: _findLeague(),
//                      )
//                    ],
//                  ),
//                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> _refreshData() async {
    print("refreshdata");
    vsGames.clear();
    user = Functions.getUser(context, {"id": "-1"});

    _bloc.sink.add(await Functions.myGames(context, {"game_id": "1"}));
  }

  _findPlayer() {}

  _findLeague() {}

  _openVSGame(VSGame vsGame) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => GameDetails()));
  }

  List<Widget> gameRows(List<VSGame> vsGames) {
    List<Widget> gameRows = List<Widget>();
    return vsGames
        .map((e) => Container(
              child: Text(e.p1_id.toString()),
            ))
        .toList();
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
