import 'package:flutter/material.dart';
import 'package:weather_app/pages/search_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        actions: [
        IconButton(
        onPressed: ()
    {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SearchPage()));
    }, icon: Icon(Icons.search),)
    ],
    title: Text("Weather App"),
    ),
    body: Center(
    child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
    Text(
    'there is no weather 😔 start',
    textAlign:TextAlign.center ,
    style: TextStyle(
    fontSize: 30,
    ),
    ),
    Text(
    'searching now 🔍',
    style: TextStyle(
    fontSize: 30,
    ),
    ),
    ]
    ),
    )
    );
  }
}
