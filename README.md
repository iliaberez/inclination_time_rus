# inclination_time_rus

Package для склонения времени и получения разницы во времени

## Начало работы

```yaml
    dependecies:
        flutter:
            sdk: flutter
        inclinator_time_rus: 
```

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
Основные методы
Получение разницы во времени(eventStartDate - дата начала события). Возвращает TimerCustom.
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

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
