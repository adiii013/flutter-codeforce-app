import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
   
  final String username;
  final String url;
  final String rank;
  final String maxRank;
  final String rating;
  final String maxRating;

  ProfileView(this.username,this.url,this.rank,this.maxRank,this.rating,this.maxRating);


  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
        children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
          child: Image.network(url)),
        Container(
          margin: EdgeInsets.all(20),
          child: Text(username)),
        Container(
          margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               Column(
                 children: [
                 Text('Rank'),
                 Text(rank),
               ],),
               Column(children: [
                 Text('Max Rank'),
                 Text(maxRank)
               ],)
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               Column(children: [
                 Text('Rating'),
                 Text(rating),
               ],),
               Column(children: [
                 Text('Max Rating'),
                 Text(maxRating)
               ],)
            ],
          ),
        )

      ],) ,);
  }
}