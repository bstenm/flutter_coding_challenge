import 'package:flutter/foundation.dart';
import '../utils/groupByFirstLetter.dart';

class ContactListState with ChangeNotifier {
  List<String> _selected = List<String>();
  List<String> _contacts = List<String>();
  Map<String, List> _entries = Map<String, List>();
  Map<String, List> _sortedContacts = Map<String, List>();

  ContactListState(contacts) {
    _contacts = contacts;
    _contacts.sort();
    _sortedContacts = groupByFirstLetter(_contacts);
    _entries.addAll(_sortedContacts);
  }

  Map<String, List> get entries => _entries;

  List<String> get selected => _selected;

  void clearSelected() {
    _selected.clear();
    notifyListeners();
  }

  /// add contact into selected list if not yet included
  void select(String name) {
    if (_selected.contains(name)) {
      return;
    }
    _selected.add(name);
    notifyListeners();
  }

  /// reset filtered entries to all contacts
  void resetEntries() {
    _entries.clear();
    _entries.addAll(_sortedContacts);
    notifyListeners();
  }

  /// gets the list of contacts containing the search term
  void filterByTerm(String searchTerm) {
    List<String> matches = List<String>();

    // if no search term get all entries
    if (searchTerm.isEmpty) {
      _entries.clear();
      _entries.addAll(_sortedContacts);
      notifyListeners();
      return;
    }

    // get the contacts  containing the search term
    _contacts.forEach((contact) {
      if (contact.toLowerCase().contains(searchTerm.toLowerCase())) {
        matches.add(contact);
      }
    });

    // set entries to map containing all matches
    _entries.clear();
    _entries.addAll(groupByFirstLetter(matches));
    notifyListeners();
  }
}
