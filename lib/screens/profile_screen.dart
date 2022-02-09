import 'dart:convert';
import 'package:codeforces_app/components/circulating_circle.dart';
import 'package:codeforces_app/components/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatefulWidget {
  final String username;
  ProfileScreen(this.username);
  @override
  State<ProfileScreen> createState() => _ProfileScreenState(username);
}

class _ProfileScreenState extends State<ProfileScreen> {
  final String user;
  _ProfileScreenState(this.user);

  @override
  Widget build(BuildContext context) {
    Future<List<dynamic>> getData() async {
      http.Response response;
      response = await http.get(
          Uri.parse('https://codeforces.com/api/user.info?handles=${user}'));

      return jsonDecode(response.body)['result'];
    }

    @override
    void initState() {
      getData();
      super.initState();
    }

    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            String username = snapshot.data![0]['handle'].toString();
            String url = snapshot.data![0]['avatar'].toString();
            String rank = snapshot.data![0]['rank'].toString();
            String maxRank = snapshot.data![0]['maxRank'].toString();
            String maxRating = snapshot.data![0]['maxRating'].toString();
            String rating = snapshot.data![0]['rating'].toString();
            return ProfileView(username, url, rank, maxRank, rating, maxRating);
          } else {
            return Circle();
          }
        },
      ),
    );
  }
}
