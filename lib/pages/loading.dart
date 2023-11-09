import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async{
    WorldTime instance = WorldTime(location: 'Algiers', flag:'germany.png',url:"Africa/Algiers");
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location' : instance.location,
      'flag' : instance.flag,
      'time': instance.time,
      'isDay' : instance.isDay,
    });
  }
  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitCircle(
          color: Colors.grey,
          size: 80.0,
        ),
    ),
    );
  }
}
