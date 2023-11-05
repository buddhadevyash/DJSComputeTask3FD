import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class UserPage extends StatelessWidget {
  final List<dynamic> userData;

  UserPage({required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Page'),
      ),
      body: ListView.builder(
        itemCount: userData.length,
        itemBuilder: (context, index) {
          final user = userData[index];
          return ListTile(
              leading: CircleAvatar(
              child: Text('${index +1 }'),
                backgroundColor: Colors.black,
               ),

            title: Text(user['name']['first'] + ' ' + user['name']['last']),
            subtitle: Text(user['email']),
          );
        },
      ),
    );
  }
}