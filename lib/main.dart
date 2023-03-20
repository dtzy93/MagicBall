import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const BallPage());
}

class BallPage extends StatelessWidget {
  const BallPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlue.shade50,
        appBar: AppBar(
          backgroundColor: Colors.lightBlue.shade900,
          title: Center(
            child: Text('Ask Me Anything!'),
          ),
        ),
        body: MagicBall(),
      ),
    );
  }
}

class MagicBall extends StatefulWidget {
  const MagicBall({Key? key}) : super(key: key);

  @override
  State<MagicBall> createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  int ballNumber = 0 ;
  int quoteNumber = 1;
  String quote1 = 'God will not look you over for medals, degrees or diplomas but for scars.';
  String quote2 = 'Do not be afraid; our fate, Cannot be taken from us; it is a gift.';
  String quote3 = 'The reason birds can fly and we cant is simply because they have perfect faith, for to have faith is to have wings.';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 10,),
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Input Your Question Here',
              hintStyle: TextStyle(fontSize: 20, color: Colors.red),
              icon: Icon(Icons.pending),
              iconColor: Colors.red
            ),
          ),
          SizedBox(height: 30,),
          TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.hovered))
                      return Colors.blue.withOpacity(0.04);
                    if (states.contains(MaterialState.focused) ||
                        states.contains(MaterialState.pressed))
                      return Colors.blue.withOpacity(0.12);
                    return null; // Defer to the widget's default.
                  },
                ),
              ),
              onPressed: () { setState(() {
                randomized();
                print('Ball $ballNumber has been displayed');
              });},
              child: Text('Show Answer',
              style: TextStyle(fontSize: 30),
              )
          ),
          SizedBox(height: 30,),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  TextButton(
                    onPressed: (){
                      setState(() {
                        randomized();
                        print('Ball $ballNumber has been displayed');
                      });
                    },
                  child: Image.asset('images/ball$ballNumber.png', width: 600, height: 600,),
                  ),
              ],
            ),
          ),
          if(quoteNumber == 1)
            Text(quote1,textAlign: TextAlign.center,style: TextStyle(fontFamily: ('edu'),fontSize: 30,height: 1.5,color: Colors.deepOrangeAccent,shadows: [Shadow(blurRadius: 10.0,color: Colors.black45,offset: Offset(10.0,10.0))]),)
          else if(quoteNumber == 2)
            Text(quote2,textAlign: TextAlign.center,style: TextStyle(fontFamily: ('edu'),fontSize: 30,height: 1.5,color: Colors.deepOrangeAccent,shadows: [Shadow(blurRadius: 10.0,color: Colors.black45,offset: Offset(10.0,10.0))]),)
          else if(quoteNumber == 3)
              Text(quote3,textAlign: TextAlign.center,style: TextStyle(fontFamily: ('edu'),fontSize: 30,height: 1.5,color: Colors.deepOrangeAccent,shadows: [Shadow(blurRadius: 10.0,color: Colors.black45,offset: Offset(10.0,10.0))]),)
        ],
      ),
    );
  }
  void randomized(){
    ballNumber = Random().nextInt(5) + 1;
    quoteNumber = Random().nextInt(3) + 1;
  }
}

