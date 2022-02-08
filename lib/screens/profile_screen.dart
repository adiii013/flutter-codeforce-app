import 'dart:convert';
import 'package:codeforces_app/components/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    List? userData;

    Future<List<dynamic>> getData() async {
      http.Response response;
      response = await http.get(
          Uri.parse('https://codeforces.com/api/user.info?handles=DmitriyH'));

      return jsonDecode(response.body)['result'];
    }

    @override
    void initState() {
      getData();
      super.initState();
    }

    return Scaffold(
        body: Center(
      child: FutureBuilder<List<dynamic>>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            String username = snapshot.data![0]['handle'].toString();
            String url = snapshot.data![0]['avatar'].toString();
            String rank = snapshot.data![0]['rank'].toString();
            String maxRank = snapshot.data![0]['maxRank'].toString();
            String maxRating = snapshot.data![0]['maxRating'].toString();
            String minRating = snapshot.data![0]['minRating'].toString();
            return ProfileView(
                username, url, rank, maxRank, minRating, maxRating);
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    ));
  }
}
