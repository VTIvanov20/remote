import 'package:flutter/material.dart';
import 'package:movie_app/widgets/components/link_button.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _repoUrl = Uri.parse('https://github.com/VTIvanov20/flutter-app');
final Uri _bugUrl =
    Uri.parse('https://github.com/VTIvanov20/flutter-app/issues');
final Uri _wikiUrl =
    Uri.parse('https://github.com/VTIvanov20/flutter-app/wiki');

class CustomPopupMenuButton extends StatelessWidget {
  final Function(String) onItemSelected;

  CustomPopupMenuButton({required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(
        Icons.more_vert,
        color: Colors.white,
      ),
      onSelected: (String result) {
        onItemSelected(result);
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        _buildPopupMenuItem(
          value: 'item1',
          icon: Icons.code_rounded,
          text: 'repo',
        ),
        _buildPopupMenuItem(
          value: 'item2',
          icon: Icons.bug_report,
          text: 'bug',
        ),
        _buildPopupMenuItem(
          value: 'item3',
          icon: Icons.info,
          text: 'wiki',
        ),
      ],
    );
  }

  PopupMenuItem<String> _buildPopupMenuItem({
    required String value,
    required IconData icon,
    required String text,
  }) {
    return PopupMenuItem<String>(
      value: value,
      child: Row(
        children: [
          LinkIcon(
            icon: icon,
            onPressed: () {
              switch (text){
                case "repo": {
                  _launchRepoUrl();
                }
                break;
                case "bug": {
                  _launchBugUrl();
                }
                break;
                case "wiki": {
                  _launchWikiUrl();
                }
                break;
              }
            },
          ),
          Text(text),
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
