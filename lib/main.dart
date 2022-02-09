import 'package:codeforces_app/screens/rating_screen.dart';
import 'package:flutter/material.dart';
import './screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Codeforces'),
            bottom: TabBar(
              padding: EdgeInsets.all(7),
              tabs: [
              Text('Profile',style: TextStyle(fontSize: 20),),
              Text('Rating'),
              Text('Problems'),
            ],),
          ),
          body: TabBarView(
            children: [
              ProfileScreen(),
              RatingScreen(),
              Icon(Icons.access_alarm)
            ],
          ),
        ),
      ),
    );
  }
}
