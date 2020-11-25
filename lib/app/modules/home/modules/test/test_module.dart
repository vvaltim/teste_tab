import 'package:teste_tab/app/modules/home/modules/test/pages/restart_page/restart_page_page.dart';

import 'pages/restart_page/restart_page_bloc.dart';
import 'package:teste_tab/app/modules/home/modules/test/modules/hellow/hellow_module.dart';

import 'test_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'test_page.dart';

class TestModule extends ChildModule {
  static final String HELLOW = "/hellow";
  static final String RESTART = "/restart";

  @override
  List<Bind> get binds =>
      [Bind((i) => RestartPageBloc()), Bind((i) => TestBloc())];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => TestPage()),
        ModularRouter(RESTART, child: (_, args) => RestartPagePage()),
        ModularRouter(HELLOW, module: HellowModule())
      ];

  static Inject get to => Inject<TestModule>.of();
}
