import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(location: 'Algiers', flag: 'dz.png', url: 'Africa/Algiers'),
    WorldTime(location: 'Cairo', flag: 'eg.png', url: 'Africa/Cairo'),
    WorldTime(location: 'Helsinki', flag: 'fl.png', url: 'Europe/Helsinki'),
    WorldTime(location: 'New York', flag: 'us.png', url: 'America/New_York'),
    WorldTime(location: 'Paris', flag: 'fr.png', url: 'Europe/Paris'),
    WorldTime(location: 'Berlin', flag: 'gr.png', url: 'Europe/Berlin'),
    WorldTime(location: 'London', flag: 'uk.jpg', url: 'Europe/London'),
    WorldTime(location: 'Chicago', flag: 'us.png', url: 'America/Chicago'),
    WorldTime(location: 'Jakarta', flag: 'ind.png', url: 'Asia/Jakarta'),
    WorldTime(location: 'Seoul', flag: 'kr.png', url: 'Asia/Seoul'),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location' : instance.location,
      'flag' : instance.flag,
      'time': instance.time,
      'isDay' : instance.isDay,
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
            "choose location",
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[700],
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap : () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      )
    );
  }
}
