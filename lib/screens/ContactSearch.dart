import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/SearchBox.dart';
import '../widgets/ContactList.dart';
import '../widgets/GroupMessageContacts.dart';
import '../widgets/ScrollControlButtons.dart';
import '../state/ContactListState.dart';

class ContactSearch extends StatefulWidget {
  ContactSearch({
    Key key,
  }) : super(key: key);

  @override
  _ContactSearchState createState() => _ContactSearchState();
}

class _ContactSearchState extends State<ContactSearch> {
  bool _searchOn;
  ScrollController _scrollController;
  TextEditingController _searchController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _searchController = TextEditingController();
    _searchOn = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _contactList = Provider.of<ContactListState>(context);

    return Scaffold(
      appBar: AppBar(
        title: _searchOn
            ? SearchBox(
                controller: _searchController,
                filterContacts: _contactList.filterByTerm,
              )
            : Text(
                'My Contacts',
                key: Key('title'),
              ),
        actions: <Widget>[
          _searchOn
              ? IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    // clear search input
                    _searchController.clear();
                    // reset entries to all contacts
                    _contactList.resetEntries();
                    setState(() {
                      _searchOn = false;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      _searchOn = true;
                    });
                  },
                ),
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Visibility(
              visible: !_searchOn,
              child: ScrollControlButtons(
                entries: _contactList.entries,
                scrollController: _scrollController,
              ),
            ),
            Expanded(
              child: ContactList(
                contactList: _contactList,
                selectDisabled: _searchOn,
                scrollController: _scrollController,
              ),
            ),
            Visibility(
              visible: !_searchOn,
              child: GroupedContacts(),
            ),
          ],
        ),
      ),
    );
  }
}
