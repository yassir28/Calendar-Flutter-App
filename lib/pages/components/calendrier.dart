import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarController _controller;
  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: TableCalendar(
          calendarStyle: CalendarStyle(
            todayColor: Colors.indigo[400],
            selectedColor: Colors.pink[300],
            selectedStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          headerStyle: HeaderStyle(
            centerHeaderTitle: true,
            formatButtonDecoration: BoxDecoration(
              color: Colors.indigo[400],
              borderRadius: BorderRadius.circular(20),
            ),
            formatButtonTextStyle: TextStyle(color: Colors.white),
            formatButtonShowsNext: false,
          ),
          startingDayOfWeek: StartingDayOfWeek.monday,
          onDaySelected: (date, events, holidays) {
            print(date.toIso8601String());
          },
          calendarController: _controller,
        ),
      ),
    );
  }
}
