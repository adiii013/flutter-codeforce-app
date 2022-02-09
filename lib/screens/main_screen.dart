import 'package:codeforces_app/screens/tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    String name = '';
    final usernameController = TextEditingController();

    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, 
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
                child: Text(
              'Enter text',
              style: TextStyle(fontSize: 20),
            )),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  'Ok',
                  style: TextStyle(fontSize: 17),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    void putUsername() {
      final username = usernameController.text;
      if (username.isEmpty) {
        _showMyDialog();
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return TabScreen(username);
        }));
      }
    }

    return Scaffold(
        appBar: AppBar(title: Text('Codeforces Viewer')),
        body: Container(
          margin: EdgeInsets.all(50),
          child: Center(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: UnderlineInputBorder(),
                  ),
                  controller: usernameController,
                  onSubmitted: (_) => {putUsername()},
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Made with ',
                        style: TextStyle(fontSize: 20),
                      ),
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 30,
                      ),
                      Text(
                        " by Aditya",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
