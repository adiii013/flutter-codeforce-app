import 'package:flutter/material.dart';

class SubmissionView extends StatelessWidget {
  final String problemIndex;
  final String name;
  final int rating;
  final String participantType;
  final String verdict;

  SubmissionView(this.problemIndex, this.name, this.rating,
      this.participantType, this.verdict);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 5, 10),
      child: Card(
        elevation: 6,
        child: Column(
          children: [
            Text(problemIndex),
            Text(name),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text('Rating'),
                    Text(rating.toString())
                  ],
                ),
                Column(
                  children: [
                    Text('Participant Type'),
                    Text((participantType=='CONTESTANT')?'Contestant':'Practise'),
                  ],
                ),
                Column(
                  children: [
                    Text('Verdict'),
                    (verdict)=='OK' ? Icon(Icons.check,color: Colors.green,) : Icon(Icons.close,color: Colors.red,),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
