import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/services/world_time.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    WorldTime time = WorldTime(location: "Berlin", flag: "germany.png", url: "Europe/Berlin");
    await time.getTime();

    // back to home screen & clears router
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "location": time.location,
      "flag": time.flag,
      "time": time.time,
      "isDaytime": time.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: SpinKitFadingCube(
        color: Colors.white,
        size: 50.0,
      ),
    );
  }
}
