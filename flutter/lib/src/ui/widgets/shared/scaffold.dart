import 'package:flutter/material.dart';

/// Wrapper around [Scaffold] used as screen UI base.
///
/// This example shows a simple [body] wrapped by the [AppScaffold].
///
/// ```dart
/// AppScaffold(
///   body: Center(
///     child: Text("Hello World"),
///   ),
/// )
/// ```
class AppScaffold extends StatefulWidget {
  /// [Scaffold] body which will be wrapped.
  final Widget body;

  AppScaffold({
    @required this.body,
  }) : assert(body != null);

  @override
  _AppScaffoldState createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  /// Build the scaffold based on the widget properties and wrap the body
  /// with the UI base.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              margin: (constraints.maxWidth > 600)
                  ? EdgeInsets.symmetric(horizontal: constraints.maxWidth / 6)
                  : null,
              child: widget.body,
              alignment: Alignment.topCenter,
            );
          },
        ),
      ),
    );
  }

  /// Create the [Scaffold]'s [AppBar].
  Widget _buildAppBar() {
    double screenWidth = MediaQuery.of(context).size.width;

    return AppBar(
      title: Container(
          margin: EdgeInsets.only(
            left: screenWidth > 600 ? screenWidth / 8 : 0.0,
          ),
          child: FlatButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil('/', (_) => false);
            },
            child: RichText(
              text: TextSpan(
                style: Theme.of(context)
                    .textTheme
                    .headline
                    .apply(fontWeightDelta: 2),
                children: <TextSpan>[
                  TextSpan(text: 'Loan '),
                  TextSpan(
                    text: 'PETIT',
                    style: Theme.of(context).textTheme.headline.apply(
                        fontWeightDelta: 2,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ],
              ),
            ),
          )),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/projects', (_) => false);
          },
          child: Text(
            "Projects",
            style: Theme.of(context).textTheme.title,
          ),
        ),
        FlatButton(
          onPressed: () {},
          child: RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.title,
              children: <TextSpan>[
                TextSpan(
                  text: 'EN',
                  style: Theme.of(context).textTheme.title,
                ),
                TextSpan(text: ' / '),
                TextSpan(
                  text: 'FR',
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .apply(color: Theme.of(context).colorScheme.primary),
                ),
              ],
            ),
          ),
        ),
      ],
      elevation: 0,
    );
  }
}
