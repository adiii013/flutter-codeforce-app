import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
   
  final String username;
  final String url;
  final String rank;
  final String maxRank;
  final String minRating;
  final String maxRating;

  ProfileView(this.username,this.url,this.rank,this.maxRank,this.minRating,this.maxRating);


  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(children: [
        Image.network(url),
        Text(username),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
             Column(children: [
               Text('Rank'),
               Text(rank),
             ],),
             Column(children: [
               Text('Max Rank'),
               Text(maxRank)
             ],)
          ],
        )

      ],) ,);
  }
}