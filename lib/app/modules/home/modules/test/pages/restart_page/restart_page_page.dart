import 'package:flutter/material.dart';

class RestartPagePage extends StatefulWidget {
  final String title;

  const RestartPagePage({Key key, this.title = "RestartPage"})
      : super(key: key);

  @override
  _RestartPagePageState createState() => _RestartPagePageState();
}

class _RestartPagePageState extends State<RestartPagePage> {
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
