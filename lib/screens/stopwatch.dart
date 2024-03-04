import 'dart:async';

import 'package:flutter/material.dart';



class StopWatch extends StatefulWidget {
  const StopWatch({super.key});

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  Stopwatch stopwatch = Stopwatch();
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
        const Duration(milliseconds: 30), _updateElapsedTime);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 5,
          shadowColor: Colors.grey,
          backgroundColor:  Colors.black,
          title: const Text(
            'Stopwatch',
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: const [
            Icon(
              Icons.add,
              color: Colors.white,
              size: 33,
            ),


          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 320,
                width: 320,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 12),
                ),
                alignment: Alignment.center,
                child: Text(
                  formatTime(stopwatch.elapsed),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      )
                  ),
                  onPressed: () {
                    setState(() {
                      if (stopwatch.isRunning) {
                        stopwatch.stop();
                      } else {
                        stopwatch.start();
                      }
                    });
                  },
                  child: Text(
                    stopwatch.isRunning ? 'Stop' : 'Start',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      )
                  ),
                  onPressed: () {
                    setState(() {
                      stopwatch.reset();
                    });
                  },
                  child: const Text(
                    'Reset',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _updateElapsedTime(Timer timer) {
    if (stopwatch.isRunning) {
      setState(() {});
    }
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String minutes = twoDigits(duration.inMinutes);
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    String milliseconds = twoDigits((duration.inMilliseconds % 1000) ~/ 10);
    return '$minutes:$seconds.$milliseconds';
  }
}
