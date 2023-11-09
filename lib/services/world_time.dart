import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location;
  String time='';
  String flag;
  String url;
  bool isDay=false;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async{
    try{
      Uri uri = Uri.parse('https://worldtimeapi.org/api/timezone/$url');
      Response response = await get(uri);
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String utc_offset = data['utc_offset'].substring(1,3);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours:int.parse(utc_offset)));

      // set the time property
      isDay = now.hour > 6 && now.hour < 20? true : false;
      time = DateFormat.jm().format(now);
      print(time);
    } catch(e){
      print(e);
      time="location not found";
    }
  }
}
