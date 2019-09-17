import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'GroupMessageContactList.dart';
import 'GroupMessageContactsButtons.dart';
import '../state/ContactListState.dart';

class GroupedContacts extends StatelessWidget {
  GroupedContacts({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _contactList = Provider.of<ContactListState>(context);

    return Visibility(
      // visible only if some contacts have already been selected
      visible: _contactList.selected.length > 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Divider(
            color: Colors.green[400],
          ),
          GroupMessageContactList(
            selectedContacts: _contactList.selected,
          ),
          Divider(
            color: Colors.black26,
          ),
          GroupMessageContactsButtons(
            contactList: _contactList,
          ),
        ],
      ),
    );
  }
}
