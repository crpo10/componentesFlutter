import 'package:componentes/src/pages/alert_page.dart';
// import 'package:componentes/src/pages/card_page.dart';
import 'package:componentes/src/routes/routes.dart';
// import 'package:componentes/src/pages/home_temp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English, no country code
        const Locale('es', 'ES'),
      ],
      title: 'Componentes APP',
      // home: HomePage(),
      initialRoute: '/',
      routes: getApplicationRoute(),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => AlertPage());
      },
    );
  }
}
