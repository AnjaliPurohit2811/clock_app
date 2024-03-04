import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';



class AnalogClock extends StatefulWidget {
  const AnalogClock({super.key});

  @override
  State<AnalogClock> createState() => _AnalogClockState();
}
DateTime dateTime = DateTime.now();

class _AnalogClockState extends State<AnalogClock> {
  @override
  Widget build(BuildContext context) {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        dateTime = DateTime.now();
      });
    });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Clock' , style: TextStyle(
              color: Colors.white ,
              fontSize: 30
          ),),
          centerTitle: true,
        ),
        body: Container(

          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'asset/img/b1.jpeg',

                  ),
                  fit: BoxFit.cover
              )
          ),

          child: Center(
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 3),
                  boxShadow: [BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 10,
                      blurRadius: 10,
                      blurStyle: BlurStyle.outer
                  )],
                  image: DecorationImage(image: AssetImage('asset/img/h.png'))

              ),
              child: Stack(
                children: [

                  ...List.generate(60, (index) => Transform.rotate(angle: index * 6* pi / 180,
                    child: Center(
                      child: VerticalDivider(
                        color: index%5==0 ? Colors.red : Colors.white,
                        thickness: 3,
                        indent: index%5==0 ? 280 : 285,

                      ),
                    ),
                  )),
                  Center(
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 6,
                                blurRadius: 10
                            )]
                        ),
                      )
                  ),
                  Center(
                    child: Transform.rotate(
                      angle: dateTime.second * 6 *pi /180,
                      child: VerticalDivider(
                        width: 5,
                        color: Colors.red,
                        thickness: 3,
                        indent: 20,
                        endIndent: 130,
                      ),
                    ),
                  ),
                  Center(
                    child: Transform.rotate(
                      angle: dateTime.minute * 6 *pi /180,
                      child: VerticalDivider(
                        width: 5,
                        color: Colors.white,
                        thickness: 5,
                        indent: 40,
                        endIndent: 130,
                      ),
                    ),
                  ),
                  Center(
                    child: Transform.rotate(
                      angle: (dateTime.hour % 12 + dateTime.minute / 60) * 30 * pi / 180,
                      child: VerticalDivider(
                        width: 5,
                        color: Colors.white,
                        thickness: 7,
                        indent: 60,
                        endIndent: 130,
                      ),
                    ),
                  ),

                ],
              ),

            ),
          ),
        ),
      ),
    );
  }
}
