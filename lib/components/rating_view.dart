import 'package:flutter/material.dart';

class RatingView extends StatelessWidget {
  final String contestName;
  final int rank;
  final int oldRating;
  final int newRating;

  RatingView(this.contestName, this.rank, this.oldRating, this.newRating);

  @override
  Widget build(BuildContext context) {
      final int diff = newRating - oldRating;

    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Container(
        height: 180,

        alignment: Alignment.center,
        margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
        child: Card(
          elevation: 6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(contestName,textAlign: TextAlign.center,style: TextStyle(fontSize: 20,color: Colors.deepOrange,fontWeight: FontWeight.bold),)),
              Text('Rank : ${rank}',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.grey),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [Text('OldRating',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),), Text(oldRating.toString(),style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)],
                  ),
                  Column(
                    children: [Text('NewRating',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),), Text(newRating.toString(),style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)],
                  ),
                  Column(
                    children: [
                      Text('RatingChange',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                      (diff>=0)?
                      Text((newRating - oldRating).toString(),style: TextStyle(color: Colors.green,fontSize: 17,fontWeight: FontWeight.bold),):
                      Text((newRating - oldRating).toString(),style: TextStyle(color: Colors.red,fontSize: 17,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
