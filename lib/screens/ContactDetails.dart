import 'package:flutter/material.dart';

class ContactDetails extends StatelessWidget {
  final String name;

  ContactDetails({
    Key key,
    @required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Details'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text(
          name,
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.grey[600],
          ),
        ),
      ),
    );
  }
}
