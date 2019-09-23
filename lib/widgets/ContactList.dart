import 'package:flutter/material.dart';
import '../state/ContactListState.dart';
import 'DictionaryEntryHeader.dart';
import 'DictionaryEntryContactList.dart';

class ContactList extends StatelessWidget {
  ContactList({
    Key key,
    @required this.contactList,
    @required this.selectDisabled,
    @required this.scrollController,
  }) : super(key: key);

  final bool selectDisabled;
  final ScrollController scrollController;
  final ContactListState contactList;

  @override
  Widget build(BuildContext context) {
    Map _entries = contactList.entries;

    return ListView.builder(
      shrinkWrap: true,
      controller: scrollController,
      itemCount: _entries.keys.length,
      itemBuilder: (context, index) {
        // the alphabetical letter corresponding
        // to the first letter of a group of contacts
        String entry = _entries.keys.toList()[index];
        List entryContactList = _entries[entry];

        return Column(
          children: <Widget>[
            DictionaryEntryHeader(entry: entry),
            EntryContactList(
              entries: entryContactList,
              onSelect: contactList.select,
              selectDisabled: selectDisabled,
              selectedContacts: contactList.selected,
            ),
          ],
        );
      },
    );
  }
}
