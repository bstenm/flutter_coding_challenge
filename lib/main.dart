import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/ContactSearch.dart';
import 'state/ContactListState.dart';

final contacts = <String>[
  'Adi Shamir',
  'Alan Kay',
  'Andrew Yao',
  'Barbara Liskov',
  'Kristen Nygaard',
  'Leonard Adleman',
  'Leslie Lamport',
  'Ole-Johan Dahl',
  'Peter Naur',
  'Robert E. Kahn',
  'Ronald L. Rivest',
  'Vinton G. Cerf',
];

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (_) => ContactListState(contacts),
      child: MaterialApp(
        title: 'Contact Listing',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: ContactSearch(),
      ),
    );
  }
}
