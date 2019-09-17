import 'package:flutter/material.dart';
import '../config.dart';

class ScrollControlButtons extends StatelessWidget {
  final Map entries;
  final ScrollController scrollController;
  final List<Map> _groupByPosition = List<Map>();

  ScrollControlButtons({
    Key key,
    @required entries,
    @required scrollController,
  })  : entries = entries,
        scrollController = scrollController,
        super(key: key) {
    List keys = entries.keys.toList()..sort();
    double position = 0.0;

    // build new data structure with
    // physical position as key
    keys.forEach((k) {
      Map e = new Map();
      e['groupId'] = k;
      e['position'] = position;
      _groupByPosition.add(e);
      position +=
          entryHeadingHeight + (entries[k].length * contactListingHeight);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _groupByPosition.map((entry) {
        return Container(
          margin: EdgeInsets.all(5.0),
          width: 40.0,
          child: FlatButton(
            color: Colors.grey[300],
            child: Text(entry['groupId']),
            onPressed: () {
              // we scroll to the position corresponding to the letter pressed
              scrollController.animateTo(
                entry['position'],
                duration: new Duration(seconds: 1),
                curve: Curves.ease,
              );
            },
          ),
        );
      }).toList(),
    );
  }
}
