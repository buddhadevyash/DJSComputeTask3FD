import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'UserPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intro Page',
      theme: ThemeData.dark(),
      home: IntroPage(),
    );
  }
}

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late int numberOfUsers;
  late List<dynamic> userData;

  void getUsers() async {
    final response = await http.get(Uri.parse('https://randomuser.me/api/?results=$numberOfUsers'));

      final data = json.decode(response.body);
      setState(() {
        userData = data['results'];
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UserPage(userData: userData),
        ),
      );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Intro Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Text(
              'Enter the number of users:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Container(
              width: 200,
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    numberOfUsers = int.tryParse(value) ?? 0;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: numberOfUsers > 0 ? getUsers : null,
              child: Text('Get Users'),
            ),
          ],
        ),
      ),
    );
  }
}

