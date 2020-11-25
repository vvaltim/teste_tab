import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste_tab/app/modules/home/modules/test/test_module.dart';

class TestPage extends StatefulWidget {
  final String title;

  const TestPage({Key key, this.title = "Test"}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Início"),
      ),
      child: CustomScrollView(
        slivers: [
          SliverSafeArea(
            sliver: SliverFillRemaining(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CupertinoButton(
                    child: Text("Ir pra modulo"),
                    onPressed: () {
                      Navigator.of(context).pushNamed(TestModule.HELLOW);
                    },
                  ),
                  CupertinoButton(
                    child: Text("Ir pra página"),
                    onPressed: () {
                      Navigator.of(context).pushNamed(TestModule.RESTART);
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
