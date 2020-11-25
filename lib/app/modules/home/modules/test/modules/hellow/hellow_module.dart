import 'hellow_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'hellow_page.dart';

class HellowModule extends ChildModule {
  @override
  List<Bind> get binds => [Bind((i) => HellowBloc())];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HellowPage()),
      ];

  static Inject get to => Inject<HellowModule>.of();
}
