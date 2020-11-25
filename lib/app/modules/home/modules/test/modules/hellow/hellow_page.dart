import 'package:flutter/material.dart';

class HellowPage extends StatefulWidget {
  final String title;
  const HellowPage({Key key, this.title = "Hellow"}) : super(key: key);

  @override
  _HellowPageState createState() => _HellowPageState();
}

class _HellowPageState extends State<HellowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
