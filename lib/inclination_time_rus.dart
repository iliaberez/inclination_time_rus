library inclination_time_rus;

class TimerCustom{
  int day;
  int hour;
  int minutes;
  int seconds;
  TimerCustom(this.day, this.hour, this.minutes,this.seconds);

  DateTime getTimeNow() => DateTime.now().toUtc();

  TimerCustom getDifferenceTime(DateTime eventStartDate){
    Duration getDifference() => eventStartDate.difference(getTimeNow());
    var days = getDifference().inDays;
    var hour = getDifference().inMinutes - days*24;
    var minutes = getDifference().inMinutes - days * 24 * 60 - hour * 60;
    var seconds = getDifference().inSeconds - days * 24 * 60 - hour * 60 - minutes*60;
    return TimerCustom(days,hour,minutes,seconds);
  }
}

String getStrDay(int day){
  int temp = day % 10;
  if(temp == 0){
    return 'дней';
  }
  if(temp == 1){
    return 'день';
  }
  if(day > 4 && day< 21 || day > 24 && day < 31 || day > 34 && day < 41 || day > 54 && day < 61){
    return 'дней';
  }
  return 'дня';
}

String getStrHours(int hours){
  int temp = hours % 10;
  if(temp == 0){
    return 'часов';
  }
  if(temp == 1){
    return 'час';
  }
  if(hours >= 2 && hours <= 4 ){
    return 'часа';
  }
  if(hours > 4 && hours < 21){
    return 'часов';
  }
  return 'часа';
}

String getStrMinute(int minut){
  int temp = minut % 10;
  if(temp == 0){
    return 'минут';
  }
  if(temp == 1){
    return 'минута';
  }
  if(minut > 1 && minut < 5 || minut > 21 && minut < 25 || minut > 31 && minut < 35|| minut > 41 && minut < 45 || minut > 51 && minut < 55){
    return 'минуты';
  }
  return 'минут';
}

String getStrSeconds(int sec){
  int temp = sec % 10;
  if(temp == 0){
    return 'секунд';
  }
  if(temp == 1){
    return 'секунда';
  }
  if(sec > 1 && sec < 5 || sec > 21 && sec < 25 || sec > 31 && sec < 35|| sec > 41 && sec < 45 || sec > 51 && sec < 55){
    return 'секунды';
  }
  return 'секунд';
}
