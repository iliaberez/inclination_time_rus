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

## Начало работы
1. Добавьте в pubspec.yaml
```
  dependecies:
      flutter:
          sdk: flutter
      inclinator_time_rus: 
```
2. Получите package с помощью терминала и комманды
```
  $ flutter pub get
```
3. Нужно импортировать package в ваш проект
```
import 'package:inclination_time_rus/inclination_time_rus.dart';
```
For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
