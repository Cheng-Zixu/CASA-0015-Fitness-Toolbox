import 'dart:async';

import 'package:fitness_toolbox/config/Configs.dart';
import 'package:fitness_toolbox/model/exercise.dart';
import 'package:fitness_toolbox/model/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class ItemPage extends StatefulWidget {
  final String url;

  const ItemPage({Key key, this.url}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ItemPage();
}

class _ItemPage extends State<ItemPage> {
  VideoPlayerController _controller;
  int seconds = 0;
  Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
        _controller.play();
      });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        seconds++; // time auto increment
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.fitHeight,
          colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.9), BlendMode.dstATop),
          image: AssetImage('assets/images/training.png'),
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Container(
                width: double.infinity,
                alignment: Alignment.topCenter,
                height: 250,
                child: _controller.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                    : Container(
                        color: Colors.black,
                        alignment: Alignment.center,
                        child: Text(
                          Configs.bb,
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
              ),
              SizedBox(
                height: 110,
              ),
              InkWell(
                child: Container(
                  alignment: Alignment.center,
                  //load image
                  height: 160.0,
                  width: 160.0,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.all(
                      Radius.circular(80),
                    ),
                  ),
                  child: Text(
                    '$seconds',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              InkWell(
                onTap: () {
                  Provider.of<ExerciseModel>(context, listen: false)
                      .addExercise(
                          Provider.of<User>(context, listen: false).email,
                          DateTime.now().toString(),
                          "",
                          seconds);
                  Navigator.pop(context);
                },
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    margin: EdgeInsets.symmetric(horizontal: 100),
                    height: 50,
                    width: double.infinity,
                    child: Center(
                        child: Text(
                      Configs.BACK,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
    _timer.cancel();
  }
}
