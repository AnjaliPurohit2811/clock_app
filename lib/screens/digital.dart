import 'dart:async';

import 'package:flutter/material.dart';



class DigitalClock extends StatefulWidget {
  const DigitalClock({super.key});


  @override
  State<DigitalClock> createState() => _DigitalClockState();
}
DateTime dateTime = DateTime.now();

class _DigitalClockState extends State<DigitalClock> {
  @override
  Widget build(BuildContext context) {
    Timer.periodic( const Duration(seconds: 1), (timer) {
      setState(() {
        dateTime  = DateTime.now();
      });

    });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: SafeArea(
        child: Scaffold(

            appBar: AppBar(
              backgroundColor: const Color(0xffEEF5FF),
              title: const Text('Digital Clock' , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.w500),),
              centerTitle: true,
            ),
            body: Center(

              child: Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        'asset/img/b1.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 100,
                            width: 80,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 5,
                                      spreadRadius: 2,
                                      offset: Offset(0, 5)
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Center(child: Text('${dateTime.hour%12}', style: TextStyle(fontSize: 50),)),
                          ),
                          const  Text(':' , style: TextStyle(fontSize: 50 , color: Colors.white),),
                          Container(
                            height: 100,
                            width: 80,
                            decoration: BoxDecoration(
                                color:  Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 5,
                                      spreadRadius: 2,
                                      offset: Offset(0, 5)
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Center(child: Text('${dateTime.minute}', style: TextStyle(fontSize: 50),)),
                          ),
                          const Text(':' , style: TextStyle(fontSize: 50 , color: Colors.white),),
                          Container(
                            height: 100,
                            width: 80,
                            decoration: BoxDecoration(
                                color:  Colors.white,
                                boxShadow: const[
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 5,
                                      spreadRadius: 2,
                                      offset: Offset(0, 5)
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Center(child: Text('${dateTime.second}', style: const TextStyle(fontSize: 50),)),
                          ),
                          Text(' ${dateTime.hour < 12 ? 'AM' : 'PM'}',
                            style: const TextStyle(fontSize: 50, color: Colors.white), // Adjust size here
                          ),

                        ],
                      ),
                    ),]
              ),
            )
        ),
      ),
    );
  }

}
