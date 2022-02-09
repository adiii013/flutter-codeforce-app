import 'package:flutter/material.dart';
import 'package:codeforces_app/screens/rating_screen.dart';
import 'package:codeforces_app/screens/submission_screen.dart';
import './profile_screen.dart';

class TabScreen extends StatefulWidget {
  final String username;

  TabScreen(this.username);

  @override
  State<TabScreen> createState() => _TabScreenState(username);
}

class _TabScreenState extends State<TabScreen> {
  final String username;
  _TabScreenState(this.username);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Codeforces'),
          bottom: TabBar(
            padding: EdgeInsets.all(7),
            tabs: [
              Text(
                'Profile',
                style: TextStyle(fontSize: 20),
              ),
              Text('Rating'),
              Text('Problems'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ProfileScreen(username),
            RatingScreen(username),
            SubmissionScreen(username),
          ],
        ),
      ),
    );
  }
}
