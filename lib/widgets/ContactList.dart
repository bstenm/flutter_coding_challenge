import 'package:flutter/material.dart';
import '../state/ContactListState.dart';
import '../screens/ContactDetails.dart';
import '../config.dart';

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

    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        controller: scrollController,
        itemCount: _entries.keys.length,
        itemBuilder: (context, index) {
          // the alphabetical letter corresponding
          // to the first letter of a group of contacts
          String entry = _entries.keys.toList()[index];

          return Column(
            children: <Widget>[
              Container(
                height: entryHeadingHeight,
                color: Colors.grey[200],
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  entry,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: _entries[entry].length,
                // necessary for smooth scrolling of parent list view
                // see https://api.flutter.dev/flutter/widgets/ClampingScrollPhysics-class.html
                physics: ClampingScrollPhysics(),
                itemBuilder: (BuildContext ctx, int index) {
                  // the contact name at the index of the
                  // list of names whose first letter is "entry"
                  String contact = _entries[entry][index];

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
                        onPressed: (selectDisabled ||
                                contactList.selected.contains(contact))
                            ? null
                            : () {
                                contactList.select(contact);
                              },
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
