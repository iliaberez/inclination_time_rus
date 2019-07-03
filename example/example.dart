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

class TimerModel {
  int day;
  int hour;
  int minute;
  TimerModel(this.day, this.hour, this.minute);
}

class _TimerState extends State<Timer> with TickerProviderStateMixin {
  TimerModel timer;
  AnimationController _animationController;

  DateTime _eventStartDate = DateTime.utc(2019, 8, 24, 00, 00, 00);
  Duration getDifference() =>
      _eventStartDate.difference(DateTime.now().toUtc());

  void updateTimer() async {
    while (mounted) {
      await Future<void>.delayed(Duration(minutes: 1), () {
        if (mounted) {
          setState(() {
            timer = TimerModel(
                getDifference().inDays,
                getDifference().inHours - getDifference().inDays * 24,
                getDifference().inMinutes - getDifference().inHours * 60);
          });
        }
      });
    }
  }

  void createTimer() {
    var duration = getDifference();
    var days = duration.inDays;
    var hours = duration.inHours - days * 24;
    var minutes = duration.inMinutes - days * 24 * 60 - hours * 60;
    setState(() {
      if (duration.isNegative) {
        timer = TimerModel(00, 00, 00);
      } else {
        timer = TimerModel(days, hours, minutes);
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
                            fontFamily: 'mt-bi'),
                      ),
                      Text('${getStrDay(timer.day)}',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.blue,
                              fontFamily: 'mt-bi')),
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
                              fontFamily: 'mt-bi')),
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
                            fontFamily: 'mt-bi'),
                      ),
                      Text('${getStrHours(timer.hour)}',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.blue,
                              fontFamily: 'mt-bi')),
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
                              fontFamily: 'mt-bi')),
                    ),
                  ),
                  SizedBox(width: 5),
                  Column(
                    children: <Widget>[
                      Text(
                        '${timer.minute}',
                        style: TextStyle(
                            fontSize: 44,
                            color: Colors.blue,
                            fontFamily: 'mt-bi'),
                      ),
                      Text('${getStrMinute(timer.minute)}',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.blue,
                              fontFamily: 'mt-bi')),
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