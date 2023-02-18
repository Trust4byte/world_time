import 'dart:convert';

import 'package:http/http.dart';

class WorldTime{

  late String location; // location name for the UI
  late String time; // the time in that location
  late String flag; // url to an asset flag icon
  late String url; // location url for api endpoint
  late bool isDaytime;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    // make the request
    Response response = await get(Uri.parse("https://www.timeapi.io/api/Time/current/zone?timeZone=$url"));
    Map data = jsonDecode(response.body);
    // print(data);

    // get properties from data
    time = data["time"];
    isDaytime = data["hour"] >= 6 && data["hour"] <= 20 ? true : false;
    // String offSet = data["utc_offset"].substring(1,3);

    // print(dateTime);
    // print(offSet);

    // create a DateTime object
    // DateTime now = DateTime.parse(dateTime);
    // now = now.add(Duration(hours: int.parse(offSet)));

    // set the time property
    // time = now.toString();
  }

}