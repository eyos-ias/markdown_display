import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MarkDownPage extends StatelessWidget {
  final String? mdName;
  final MarkdownStyleSheet? style;
  const MarkDownPage({super.key, required this.mdName, this.style});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Markdown reader'),
      ),
      body: FutureBuilder(
        future: rootBundle.loadString("docs/$mdName"),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            if (style != null) {
              return Markdown(
                data: snapshot.data!,
                styleSheet: style,
              );
            }
            return Markdown(
              data: snapshot.data!,
              styleSheet: MarkdownStyleSheet(
                h1: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
                h2: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
