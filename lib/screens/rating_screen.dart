import 'dart:convert';

import 'package:codeforces_app/components/circulating_circle.dart';
import 'package:codeforces_app/components/rating_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RatingScreen extends StatefulWidget {
  final String username;
  RatingScreen(this.username);
  @override
  State<RatingScreen> createState() => _RatingScreenState(username);
}

class _RatingScreenState extends State<RatingScreen> {
  final String user;
  _RatingScreenState(this.user);
  @override
  Widget build(BuildContext context) {
    Future<List<dynamic>> getRating() async {
      http.Response response;
      response = await http.get(
          Uri.parse('https://codeforces.com/api/user.rating?handle=${user}'));

      return jsonDecode(response.body)['result'];
    }

    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
        future: getRating(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Circle();
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              // reverse: true,
              itemBuilder: (context, index) {
                int count = snapshot.data!.length - 1 - index;
                String contestName =
                    snapshot.data![count]['contestName'].toString();
                int rank = snapshot.data![count]['rank'];
                int oldRating = snapshot.data![count]['oldRating'];
                int newRating = snapshot.data![count]['newRating'];
                return RatingView(contestName, rank, oldRating, newRating);
              },
            );
          }
        },
      ),
    );
  }
}
