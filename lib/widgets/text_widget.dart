import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatefulWidget {
  final String text;

  TextWidget({required this.text});

  @override
  _TextWidgetState createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    final List<String> lines = widget.text.split('\n');
    final int maxLines = 3;
    final bool isExpandable = lines.length > maxLines;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < (expanded ? lines.length : maxLines); i++)
          Text(lines[i]),
        if (isExpandable)
          GestureDetector(
            onTap: () {
              setState(() {
                expanded = !expanded;
              });
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(expanded ? 'See less' : 'See more',
                  style: GoogleFonts.raleway(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  )),
            ),
          ),
      ],
    );
  }
}
