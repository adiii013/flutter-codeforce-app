import 'dart:convert';

import 'package:codeforces_app/components/circulating_circle.dart';
import 'package:codeforces_app/components/submission_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SubmissionScreen extends StatefulWidget {
  SubmissionScreen({Key? key}) : super(key: key);

  @override
  State<SubmissionScreen> createState() => _SubmissionScreenState();
}

class _SubmissionScreenState extends State<SubmissionScreen> {
  @override
  Widget build(BuildContext context) {
    Future<List<dynamic>> getSubmission() async {
      http.Response response;
      response = await http.get(Uri.parse(
          'https://codeforces.com/api/user.status?handle=Fefer_Ivan&from=1&count=100'));
      return jsonDecode(response.body)['result'];
    }

    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
        future: getSubmission(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Circle();
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
               String problemIndex = snapshot.data![index]['problem']['index'];
               String name = snapshot.data![index]['problem']['name'];
               int rating = snapshot.data![index]['problem']['rating'];
               String participantType = snapshot.data![index]['author']['participantType'];
               String verdict = snapshot.data![index]['verdict'];
                return SubmissionView(problemIndex,name,rating,participantType,verdict);
              },
            );
          }
        },
      ),
    );
  }
}
