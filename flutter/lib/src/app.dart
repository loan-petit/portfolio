import 'package:flutter/material.dart';

import 'package:portfolio/src/router.dart';
import 'package:flutter/services.dart';

/// The main [Widget] containing the [MaterialApp] definition.
class App extends StatelessWidget {
  final _router = Router();

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: Color.fromRGBO(216, 54, 54, 1),
      primaryVariant: Color.fromRGBO(216, 54, 54, 1),
      secondary: Color.fromRGBO(216, 54, 54, 1),
      secondaryVariant: Color.fromRGBO(216, 54, 54, 1),
      surface: Color.fromRGBO(244, 244, 244, 1),
      background: Color.fromRGBO(244, 244, 244, 1),
      error: Colors.red,
      onPrimary: Color.fromRGBO(244, 244, 244, 1),
      onSecondary: Color.fromRGBO(33, 33, 33, 1),
      onSurface: Color.fromRGBO(244, 244, 244, 1),
      onBackground: Color.fromRGBO(33, 33, 33, 1),
      onError: Color.fromRGBO(244, 244, 244, 1),
    );

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: colorScheme.background,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
    ));

    return MaterialApp(
      title: 'Loan PETIT',
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
        child: child,
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: colorScheme.primary,
        primaryColorBrightness: Brightness.light,
        accentColor: colorScheme.secondary,
        accentColorBrightness: Brightness.light,
        cardColor: colorScheme.surface,
        canvasColor: colorScheme.background,
        scaffoldBackgroundColor: colorScheme.background,
        dialogBackgroundColor: colorScheme.background,
        backgroundColor: colorScheme.background,
        appBarTheme: AppBarTheme(color: colorScheme.background, brightness: Brightness.dark),
        primaryIconTheme: IconThemeData(color: colorScheme.onBackground),
        colorScheme: colorScheme,
        fontFamily: 'OpenSans',
        textTheme: Typography.englishLike2018.apply(
          displayColor: colorScheme.onBackground,
          bodyColor: colorScheme.onBackground,
          decorationColor: colorScheme.onBackground,
        ),
      ),
      initialRoute: '/',
      onGenerateRoute: _router.onGenerateRoute,
    );
  }
}
