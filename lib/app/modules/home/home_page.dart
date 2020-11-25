import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_tab/app/modules/home/modules/test/test_module.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CupertinoTabController _tabController = CupertinoTabController();

  final GlobalKey<NavigatorState> _timelineTabNavKey =
      GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> _pointTabNavKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> _hollerithTabNavKey =
      GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> _menuTabNavKey = GlobalKey<NavigatorState>();

  int _currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (currentNavigatorKey().currentState.canPop()) {
          return !await currentNavigatorKey().currentState.maybePop();
        } else {
          return await showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return CupertinoAlertDialog(
                      title: Text("Fechar o aplicativo?"),
                      actions: [
                        CupertinoButton(
                          child: Text("Não"),
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                        ),
                        CupertinoButton(
                          child: Text(
                            "Sim",
                            style: TextStyle(color: CupertinoColors.systemRed),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                        )
                      ],
                    );
                  }) ??
              false;
        }
      },
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          onTap: (index) {
            if (_currentTab == index) {
              switch (index) {
                case 0:
                  _timelineTabNavKey.currentState
                      .popUntil((route) => route.isFirst);
                  break;
                case 1:
                  _pointTabNavKey.currentState
                      .popUntil((route) => route.isFirst);
                  break;
                case 2:
                  _hollerithTabNavKey.currentState
                      .popUntil((route) => route.isFirst);
                  break;
                case 3:
                  _menuTabNavKey.currentState
                      .popUntil((route) => route.isFirst);
                  break;
              }
            }

            _currentTab = index;
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.home,
                size: 21,
              ),
              label: "Início",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.clock,
                size: 21,
              ),
              label: "Ponto",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.printer, size: 21),
              label: "Holerite",
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.tree, size: 21),
              label: "Menu",
            )
          ],
        ),
        controller: _tabController,
        tabBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return RouterOutlet(
              module: TestModule(),
              navigatorKey: _timelineTabNavKey,
            );
          }

          if (index == 1) {
            return RouterOutlet(
              module: TestModule(),
              navigatorKey: _pointTabNavKey,
            );
          }

          if (index == 2) {
            return RouterOutlet(
              module: TestModule(),
              navigatorKey: _hollerithTabNavKey,
            );
          }

          return RouterOutlet(
            module: TestModule(),
            navigatorKey: _menuTabNavKey,
          );
        },
      ),
    );
  }

  GlobalKey<NavigatorState> currentNavigatorKey() {
    switch (_tabController.index) {
      case 0:
        return _timelineTabNavKey;
        break;
      case 1:
        return _pointTabNavKey;
        break;
      case 2:
        return _hollerithTabNavKey;
        break;
      case 3:
        return _menuTabNavKey;
        break;
    }

    return null;
  }
}
