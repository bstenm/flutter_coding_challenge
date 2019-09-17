import 'package:flutter/material.dart';

class GroupMessageContactList extends StatelessWidget {
  GroupMessageContactList({
    Key key,
    @required List<String> selectedContacts,
  })  : selectedContacts = selectedContacts,
        super(key: key);

  final List<String> selectedContacts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Wrap(
        children: selectedContacts.map((contact) {
          return Container(
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Text(
              contact,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.0,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
