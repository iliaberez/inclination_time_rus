import 'package:flutter/material.dart';
import 'package:inclination_time_rus/inclination_time_rus.dart';

void main() {
  runApp(
    Timer(),
  );
}

//Inclinator can be used to create a reverse timer

class Timer extends StatefulWidget {
  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> with TickerProviderStateMixin {
  AnimationController _animationController;

  TimerCustom timer;

  DateTime _eventStartDate = DateTime.utc(2019, 8, 24, 00, 00, 00);
  Duration getDifference() =>
      _eventStartDate.difference(DateTime.now().toUtc());

  void updateTimer() async {
    while (mounted) {
      await Future<void>.delayed(Duration(minutes: 1), () {
        if (mounted) {
          setState(() {
            createTimer();
          });
        }
      });
    }
  }

  void createTimer() {
    setState(() {
      if(timer.getDifferenceTime(_eventStartDate).seconds < 0){
        timer = TimerCustom(00,00,00,00);
      }else{
        timer = timer.getDifferenceTime(_eventStartDate);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });
    _animationController.forward();
    createTimer();
    updateTimer();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 54),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        '${timer.day}',
                        style: TextStyle(
                          fontSize: 44,
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        '${getStrDay(timer.day)}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 5),
                  FadeTransition(
                    opacity: _animationController,
                    child: Transform.translate(
                      offset: Offset(0, -8),
                      child: Text(':',
                        style: TextStyle(
                          fontSize: 38,
                          color: Colors.blue,
                        )
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Column(
                    children: <Widget>[
                      Text(
                        '${timer.hour}',
                        style: TextStyle(
                          fontSize: 44,
                          color: Colors.blue,
                        ),
                      ),
                      Text('${getStrHours(timer.hour)}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                        )
                      ),
                    ],
                  ),
                  SizedBox(width: 5),
                  FadeTransition(
                    opacity: _animationController,
                    child: Transform.translate(
                      offset: Offset(0, -8),
                      child: Text(':',
                        style: TextStyle(
                          fontSize: 38,
                          color: Colors.blue,
                        )
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Column(
                    children: <Widget>[
                      Text(
                        '${timer.minutes}',
                        style: TextStyle(
                          fontSize: 44,
                          color: Colors.blue,
                        ),
                      ),
                      Text('${getStrMinute(timer.minutes)}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                        )
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}