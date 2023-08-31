import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown_display/MarkDownPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MarkDownPage(
        mdName: 'guide.md',
        style: MarkdownStyleSheet(
          h1: const TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
          h2: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
