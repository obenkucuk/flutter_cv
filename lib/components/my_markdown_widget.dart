import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

import '../config/theme/text_styles.dart';
import '../features/cookbook/views/cookbook_view.dart';

class MyMarkdownWidget extends HookWidget {
  const MyMarkdownWidget({
    super.key,
    required this.example,
  });

  final CookbookExamples example;

  @override
  Widget build(BuildContext context) {
    final markDown = useState<String>('');

    Future<void> readMd() async {
      final response = await rootBundle.loadString(example.path);
      markDown.value = response;
    }

    useEffect(
      () {
        readMd();

        return null;
      },
      [],
    );

    return MarkdownBody(
      shrinkWrap: false,
      data: markDown.value,
      selectable: true,
      styleSheetTheme: MarkdownStyleSheetBaseTheme.material,
      styleSheet: MarkdownStyleSheet(
        h1: s24W700.copyWith(color: Colors.indigo),
        h2: s22W700.copyWith(color: Colors.indigo),
        h3: s18W600.copyWith(color: Colors.indigo),
        code: const TextStyle(
          fontSize: 14,
          color: Colors.orange,
          backgroundColor: Colors.black,
        ),
        codeblockPadding: const EdgeInsets.all(8),
        codeblockDecoration: const BoxDecoration(color: Colors.black),
      ),
      onTapLink: (text, href, title) async {
        if (await canLaunchUrl(
          Uri.parse('$href'),
        )) {
          await launchUrl(Uri.parse('$href'));
        } else {}
      },
      // extensionSet: md.ExtensionSet(
      //   md.ExtensionSet.gitHubFlavored.blockSyntaxes,
      //   <md.InlineSyntax>[
      //     ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes,
      //     md.EmojiSyntax(),
      //     ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes,
      //   ],
      // ),
    );
  }
}
