import 'package:flutter/material.dart';

import '../screens/ContactDetails.dart';
import '../config.dart';

class EntryContactList extends StatelessWidget {
  EntryContactList({
    Key key,
    @required this.entries,
    @required this.selectDisabled,
    @required this.selectedContacts,
    @required this.onSelect,
  }) : super(key: key);

  final List entries;
  final List selectedContacts;
  final bool selectDisabled;
  final Function onSelect;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: entries.length,
      // necessary for smooth scrolling of parent list view
      // see https://api.flutter.dev/flutter/widgets/ClampingScrollPhysics-class.html
      physics: ClampingScrollPhysics(),
      itemBuilder: (BuildContext ctx, int index) {
        // the contact names
        String contact = entries[index];

        return Container(
          height: contactListingHeight,
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContactDetails(name: contact),
                ),
              );
            },
            title: Text(contact),
            trailing: IconButton(
              icon: Icon(Icons.add),
              disabledColor: Colors.white,
              // button disabled if the name has already been selected
              onPressed: (selectDisabled || selectedContacts.contains(contact))
                  ? null
                  : () {
                      onSelect(contact);
                    },
            ),
          ),
        );
      },
    );
  }
}
