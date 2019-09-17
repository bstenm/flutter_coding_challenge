import 'package:flutter/material.dart';

import '../state/ContactListState.dart';

class GroupMessageContactsButtons extends StatelessWidget {
  GroupMessageContactsButtons({
    Key key,
    @required this.contactList,
  }) : super(key: key);

  final ContactListState contactList;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FlatButton.icon(
          label: Text(
            'Clear',
            style: TextStyle(color: Colors.black54),
          ),
          icon: Icon(
            Icons.clear,
            color: Colors.black54,
          ),
          onPressed: () {
            // empties the list of selected contacts
            contactList.clearSelected();
          },
        ),
        FlatButton.icon(
          label: Text(
            'Message Group',
            style: TextStyle(color: Colors.black54),
          ),
          icon: Icon(
            Icons.edit,
            color: Colors.black54,
          ),
          onPressed: () {
            // show dialog for messaging
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                actions: <Widget>[
                  FlatButton.icon(
                    icon: Icon(Icons.send),
                    label: Text('Send'),
                    onPressed: () {
                      // we just close the dialog
                      Navigator.of(context).pop();
                    },
                  )
                ],
                content: TextField(
                  decoration: InputDecoration(
                    hintText: 'Message to group',
                  ),
                  maxLines: 4,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
