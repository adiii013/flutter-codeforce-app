import 'dart:convert';

import 'package:codeforces_app/components/circulating_circle.dart';
import 'package:codeforces_app/components/rating_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RatingScreen extends StatefulWidget {
  RatingScreen({Key? key}) : super(key: key);

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  @override
  Widget build(BuildContext context) {
    Future<List<dynamic>> getRating() async {
      http.Response response;
      response = await http.get(Uri.parse(
          'https://codeforces.com/api/user.rating?handle=Fefer_Ivan'));

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
              itemBuilder: (context, index) {
                String contestName =
                    snapshot.data![index]['contestName'].toString();
                int rank = snapshot.data![index]['rank'];
                int oldRating = snapshot.data![index]['oldRating'];
                int newRating = snapshot.data![index]['newRating'];
                return RatingView(contestName,rank,oldRating,newRating);
              },
            );
          }
        },
      ),
    );
  }
}
