import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: OrientationBuilder(
            builder: (context, orientation) {
              if (orientation == Orientation.portrait) {
                return buildPortraitLayout();
              } else {
                return buildLandscapeLayout();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildPortraitLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 120.0,
          backgroundImage: AssetImage('assets/img.png'), // Replace with your image
        ),
        SizedBox(height: 16.0),
        Text('John Doe', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        Text('Software Developer'),
        SizedBox(height: 16.0),
        Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: 9,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 150,
                width: 150,
                child: Image.asset('assets/img.png', fit: BoxFit.cover),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildLandscapeLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 150.0,
          backgroundImage: AssetImage('assets/img.png'), // Replace with your image
        ),
        SizedBox(width: 16.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('John Doe', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              Text('Software Developer'),
              SizedBox(height: 16.0),
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: 9,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 150,
                      width: 150,
                      child: Image.asset('assets/img.png', fit: BoxFit.cover),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
