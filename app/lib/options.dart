import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Initialization of URL holders
/// Used throught the OptionsBar Widget
final Uri _repoUrl = Uri.parse('https://github.com/VTIvanov20/flutter-app');
final Uri _bugUrl = Uri.parse('https://github.com/VTIvanov20/flutter-app/issues');
final Uri _wikiUrl = Uri.parse('https://github.com/VTIvanov20/flutter-app/wiki');

class OptionBar extends StatelessWidget {
  const OptionBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: <Widget>[
          /// Returns a single icon buttton
          /// Satisfies full app width
          Expanded(
            child: IconButton(
              icon: Icon(Icons.bug_report_outlined,
                color: Color(0xFF404040),
              ), onPressed: _launchRepoUrl,
            ),
          ),
          /// Returns a single icon buttton
          /// Satisfies full app width
          Expanded(
            child: IconButton(
              icon: Icon(Icons.bug_report_outlined,
                color: Color(0xFF404040),
              ), onPressed: _launchBugUrl,
            ),
          ),
          /// Returns a single icon buttton
          /// Satisfies full app width
          Expanded(
            child: IconButton(
              icon: Icon(Icons.bug_report_outlined,
                color: Color(0xFF404040),
              ), onPressed: _launchWikiUrl,
            ),
          ),
        ],
      ),
    );
  }
}

/// Promises async URL loading
/// Throws an exception if the URL isn't fetchable
Future<void> _launchRepoUrl() async {
  if (!await launchUrl(_repoUrl)) {
    throw Exception('Could not launch $_repoUrl');
  }
}

/// Promises async URL loading
/// Throws an exception if the URL isn't fetchable
Future<void> _launchBugUrl() async {
  if (!await launchUrl(_bugUrl)) {
    throw Exception('Could not launch $_bugUrl');
  }
}

/// Promises async URL loading
/// Throws an exception if the URL isn't fetchable
Future<void> _launchWikiUrl() async {
  if (!await launchUrl(_wikiUrl)) {
    throw Exception('Could not launch $_wikiUrl');
  }
}