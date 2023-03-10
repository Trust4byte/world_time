import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  
  @override
  Widget build(BuildContext context) {
    
    data = data.isEmpty ? ModalRoute.of(context)?.settings.arguments as Map : data;
    String dayNight = data["isDaytime"] ? "day.jpg" : "night.jpg";
    Color colorDayNight = data["isDaytime"] ? Colors.black : Colors.white;
    
    return Scaffold(
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/$dayNight",),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                children: [
                  ElevatedButton.icon(
                      onPressed: () async{
                        dynamic result = await Navigator.pushNamed(context, "/location");

                        setState(() {
                          data["location"] = result["location"];
                          data["flag"] = result["flag"];
                          data["time"] = result["time"];
                          data["isDaytime"] = result["isDaytime"];
                        });
                      },
                      icon: Icon(
                          Icons.edit_location,
                        color: Colors.grey[300],
                      ),
                      label: Text(
                          "Edit Location",
                        style: TextStyle(
                          color: Colors.grey[300],
                        ),
                      ),
                  ),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data["location"],
                        style: TextStyle(
                          fontSize: 28,
                          letterSpacing: 2,
                          color: colorDayNight,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text(
                    data["time"],
                    style: TextStyle(
                      fontSize: 66,
                      color: colorDayNight,
                    ),
                  )
                ],
              ),
            ),
          ),
      ),
    );
  }
}
