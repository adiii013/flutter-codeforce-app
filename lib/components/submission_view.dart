import 'package:flutter/material.dart';

class SubmissionView extends StatelessWidget {
  final String problemIndex;
  final String name;
  var rating;
  final String participantType;
  final String verdict;

  SubmissionView(this.problemIndex, this.name, this.rating,
      this.participantType, this.verdict);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      margin: EdgeInsets.fromLTRB(10, 5, 5, 10),
      child: Card(
        elevation: 6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(problemIndex,style: TextStyle(color: Colors.red,fontSize: 19,fontWeight: FontWeight.bold),),
            Align(
              alignment: Alignment.center,
               child:Text(name,style: TextStyle(color: Colors.orange,fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text('Rating',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text((rating!=null)?rating.toString():'?',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text('Participant Type',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text((participantType=='CONTESTANT')?'Contestant':'Practise',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Verdict',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                      Padding(padding: EdgeInsets.all(8.0),
                      child:(verdict)=='OK' ? Icon(Icons.check,color: Colors.green,size: 20,) :(verdict=='TIME_LIMIT_EXCEEDED') ?Icon(Icons.alarm,color: Colors.red,size: 30,):Icon(Icons.close,color: Colors.red,size: 30),)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
