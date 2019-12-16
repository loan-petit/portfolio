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
      primary: Color.fromRGBO(247, 67, 64, 1),
      primaryVariant: Color.fromRGBO(247, 67, 64, 1),
      secondary: Color.fromRGBO(247, 67, 64, 1),
      secondaryVariant: Color.fromRGBO(247, 67, 64, 1),
      surface: Color.fromRGBO(237, 242, 244, 1),
      background: Color.fromRGBO(237, 242, 244, 1),
      error: Colors.red,
      onPrimary: Color.fromRGBO(237, 242, 244, 1),
      onSecondary: Color.fromRGBO(237, 242, 244, 1),
      onSurface: Color.fromRGBO(237, 242, 244, 1),
      onBackground: Color.fromRGBO(56, 56, 56, 1),
      onError: Color.fromRGBO(237, 242, 244, 1),
    );

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: colorScheme.background,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ));

    return MaterialApp(
      title: 'Loan PETIT',
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
        child: child,
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: colorScheme.primary,
        primaryColorBrightness: Brightness.light,
        accentColor: colorScheme.secondary,
        accentColorBrightness: Brightness.light,
        cardColor: colorScheme.surface,
        canvasColor: colorScheme.background,
        scaffoldBackgroundColor: colorScheme.background,
        snackBarTheme: SnackBarThemeData(backgroundColor: colorScheme.onBackground),
        dialogBackgroundColor: colorScheme.background,
        backgroundColor: colorScheme.background,
        appBarTheme: AppBarTheme(
            color: colorScheme.background, brightness: Brightness.light),
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
