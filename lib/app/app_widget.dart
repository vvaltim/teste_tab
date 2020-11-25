import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      navigatorKey: Modular.navigatorKey,
      title: 'Teste',
      // theme: CupertinoThemeData(
      //   brightness:
      //   snapshot.data == true ? Brightness.dark : Brightness.light,
      //   primaryColor: CustomColorUtil.primaryColor,
      //   barBackgroundColor: CustomColorUtil.backgroundCardColor,
      //   scaffoldBackgroundColor: CustomColorUtil.backgroundColor,
      //   textTheme: CupertinoTextThemeData(primaryColor: CustomColorUtil.primaryColor)
      //       .copyWith(
      //       textStyle: TextStyle(
      //           fontFamily: 'Sora',
      //           color: snapshot.data == true
      //               ? CupertinoColors.lightBackgroundGray
      //               : CupertinoColors.darkBackgroundGray)),
      // ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [
        Locale('pt', 'BR'),
      ],
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
