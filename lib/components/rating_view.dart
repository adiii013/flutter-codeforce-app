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
        alignment: Alignment.center,
        margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
        child: Card(
          child: Column(
            children: [
              Text(contestName),
              Text('Rank : ${rank}'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [Text('OldRating'), Text(oldRating.toString())],
                  ),
                  Column(
                    children: [Text('NewRating'), Text(newRating.toString())],
                  ),
                  Column(
                    children: [
                      Text('RatingChange'),
                      (diff>=0)?
                      Text((newRating - oldRating).toString(),style: TextStyle(color: Colors.green),):
                      Text((newRating - oldRating).toString(),style: TextStyle(color: Colors.red),)
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
