import 'dart:ui';

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
          child: Text(username,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.red),)),
        Container(
          margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               Column(
                 children: [
                 Text('Rank', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                 Container(
                   margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                   width: 150,
                   child: Align(
                     alignment: Alignment.center,
                     child: Text(rank,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.orange),textAlign: TextAlign.center,)),
                 ),
               ],),
               Column(children: [
                 Text('Max Rank', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                 Container(
                   margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                   width: 150,
                   child: Align(child: Text(maxRank,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.deepOrange),textAlign: TextAlign.center,)))
               ],)
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               Column(
                 children: [
                 Text('Rating', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                 Container(
                   margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                   width: 150,
                   child: Align(
                     alignment: Alignment.center,
                     child: Text(rating,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.green),textAlign: TextAlign.center,)),
                 ),
               ],),
               Column(children: [
                 Text('Max Rating', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                 Container(
                   margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                   width: 150,
                   child: Align(child: Text(maxRating,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.green),textAlign: TextAlign.center,)))
               ],)
            ],
          ),
        )

      ],) ,);
  }
}