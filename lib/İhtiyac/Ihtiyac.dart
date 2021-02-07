import 'package:flutter/material.dart';

class Ihtiyac extends StatefulWidget {
  @override
  _IhtiyacState createState() => _IhtiyacState();
}

class _IhtiyacState extends State<Ihtiyac> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(child: Text("İhtiyaç"),),
        ],
      ),
    );
  }
}
