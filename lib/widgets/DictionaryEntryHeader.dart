import 'package:flutter/material.dart';
import '../config.dart';

class DictionaryEntryHeader extends StatelessWidget {
  const DictionaryEntryHeader({
    Key key,
    @required this.entry,
  }) : super(key: key);

  final String entry;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: entryHeadingHeight,
      color: Colors.grey[200],
      padding: EdgeInsets.all(10.0),
      alignment: Alignment.bottomLeft,
      child: Text(
        entry,
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
