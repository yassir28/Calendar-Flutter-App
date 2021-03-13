import 'package:flutter/material.dart';
import 'package:menstruating/models/user.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  final Function onDaySelected;

  const Calendar({Key key, this.onDaySelected}) : super(key: key);
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarController _controller;
  Map<DateTime, List<dynamic>> _events;
  List<dynamic> _selectedEvents;
  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    _events = {};
    _selectedEvents = [];
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),

      //supposedly its ovulation.

      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _controller.isSelected(date)
            ? Colors.pink[300]
            : _controller.isToday(date)
                ? Colors.pink[400]
                : Colors.indigo[400],
      ),
      width: 16.0,
      height: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

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
            setState(() {
              _selectedEvents = events;
            });
            widget.onDaySelected(user, date);
          },
          builders: CalendarBuilders(
            markersBuilder: (context, date, events, holidays) {
              final children = <Widget>[];
              if (events.isNotEmpty) {
                children.add(
                  Positioned(
                    right: 1,
                    bottom: 1,
                    child: _buildEventsMarker(date, events),
                  ),
                );
              }
              return children;
            },
          ),
          calendarController: _controller,
        ),
      ),
    );
  }
}
