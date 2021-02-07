import 'package:flutter/material.dart';

class Egitim extends StatefulWidget {
  @override
  _EgitimState createState() => _EgitimState();
}

class _EgitimState extends State<Egitim> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(child: Text("Eğitim"),),
        ],
      ),
    );
  }
}
