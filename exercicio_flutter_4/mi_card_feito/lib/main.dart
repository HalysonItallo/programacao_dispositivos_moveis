import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black87,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                  "assets/images/halyson.jpg",
                ),
              ),
              Text(
                'Halyson Itallo',
                style: TextStyle(
                    fontFamily: 'Pacifico',
                    color: Colors.pink.shade400,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                    color: Colors.pink.shade300,
                    fontSize: 20,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.pink.shade300,
                ),
              ),
              buildCard('+55 86 99526 7992', Icons.phone),
              buildCard('halyssonpimentell@gmail.com', Icons.email),
            ],
          ),
        ),
      ),
    ),
  );
}

Card buildCard(String text, IconData icon) {
  return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.black87,
        ),
        title: Text(
          text,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20.0,
          ),
        ),
      ));
}
