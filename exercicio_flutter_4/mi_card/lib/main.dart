import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(140),
                    bottomRight: Radius.circular(100),
                  ),
                  child: Container(
                    color: Colors.pink.shade400,
                    height: 500,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(200),
                  ),
                  child: Container(
                    height: 400,
                    width: double.infinity,
                    color: Colors.black,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(
                            "images/halyson.jpg",
                          ),
                        ),
                        Text(
                          'Halyson Itallo',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'FLUTTER DEVELOPER',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              letterSpacing: 2.5,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildCard('+55 86 99526 7992', Icons.phone),
                  buildCard('halyssonpimentell@gmail.com', Icons.email),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Card buildCard(String text, IconData icon) {
  return Card(
      color: Colors.black87,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.pink.shade400,
        ),
        title: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ));
}
