import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _repoUrl = Uri.parse('https://github.com/VTIvanov20/flutter-app');
final Uri _bugUrl = Uri.parse('https://github.com/VTIvanov20/flutter-app/issues');
final Uri _wikiUrl = Uri.parse('https://github.com/VTIvanov20/flutter-app/wiki');

class OptionBar extends StatelessWidget {
  const OptionBar({Key? key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: IconButton(
              icon: Icon(
                Icons.bug_report_outlined,
                color: Color(0xFF404040),
              ),
              onPressed: _launchRepoUrl,
            ),
          ),
          Expanded(
            child: IconButton(
              icon: Icon(
                Icons.bug_report_outlined,
                color: Color(0xFF404040),
              ),
              onPressed: _launchBugUrl,
            ),
          ),
          Expanded(
            child: IconButton(
              icon: Icon(
                Icons.bug_report_outlined,
                color: Color(0xFF404040),
              ),
              onPressed: _launchWikiUrl,
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> _launchRepoUrl() async {
  if (!await launchUrl(_repoUrl)) {
    throw Exception('Could not launch $_repoUrl');
  }
}

Future<void> _launchBugUrl() async {
  if (!await launchUrl(_bugUrl)) {
    throw Exception('Could not launch $_bugUrl');
  }
}

Future<void> _launchWikiUrl() async {
  if (!await launchUrl(_wikiUrl)) {
    throw Exception('Could not launch $_wikiUrl');
  }
}