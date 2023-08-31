import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MarkDownPage extends StatelessWidget {
  String? mdName;
  MarkDownPage({super.key, required this.mdName});

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
            return Markdown(data: snapshot.data!);
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
