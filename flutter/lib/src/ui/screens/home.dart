import 'package:flutter/material.dart';
import 'package:portfolio/src/app_localizations.dart';

import 'package:portfolio/src/ui/widgets/profile/profile_additional_informations.dart';
import 'package:portfolio/src/ui/widgets/profile/profile_header.dart';
import 'package:portfolio/src/ui/widgets/shared/page_navigation_button.dart';
import 'package:portfolio/src/ui/widgets/shared/scaffold/index.dart';
import 'package:portfolio/src/ui/widgets/shared/scroll_notifying_page_view.dart';

/// Porfolio home screen.
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ValueNotifier<double> _notifier;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _notifier?.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _notifier = ValueNotifier<double>(0);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: ScrollNotifyingPageView(
        scrollDirection: Axis.vertical,
        pageSnapping: false,
        notifier: _notifier,
        controller: _pageController,
        children: <Widget>[
          _buildHeader(),
          ProfileAdditionalInformations(),
        ],
      ),
    );
  }

  /// Build the profile header.
  Widget _buildHeader() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: ProfileHeader(),
        ),
        PageNavigationButton(
          label: AppLocalization.of(context).homePageNavigationButtonLabel,
          icon: Icons.expand_more,
          scrollNotifier: _notifier,
          pageController: _pageController,
        ),
      ],
    );
  }
}
