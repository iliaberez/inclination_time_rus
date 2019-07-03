# inclination_time_rus

Package для склонения времени и получения разницы во времени

### Использование

Модель 
```
class TimerCustom{
  int day;
  int hour;
  int minutes;
  int seconds;
  TimerCustom(this.day, this.hour, this.minutes,this.seconds);
}
```
### Основные методы
Получение разницы во времени(eventStartDate - дата начала события).
Возвращает TimerCustom.
```
TimerCustom getDifferenceTime(DateTime eventStartDate)
```
Используется для получения строки - дней/дня/день:
```
String getStrDay(int day)
```
Для склонения часов:
```
String getStrHours(int hours)
```
Для склонения минут:
```
String getStrMinute(int minut)
```
Для склонения секунд:
```
String getStrSeconds(int sec)
```
[Пример](https://github.com/iliaberez/inclination_time_rus/tree/master/example)
