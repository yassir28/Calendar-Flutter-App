import 'package:flutter/material.dart';
import 'package:menstruating/models/user.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  final Function onDaySelected;
  final periodLength;
  final periodCycle;
  final periodDate;

  const Calendar(
      {Key key,
      this.onDaySelected,
      this.periodCycle,
      this.periodDate,
      this.periodLength})
      : super(key: key);
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarController _controller;
  DateTime _selectedDay;

  int periodLength = 3;
  int periodCycle = 28;
  DateTime periodDate = DateTime.now().add(Duration(hours: 60));

  List<DateTime> periodDays = [];

  periodCall() {
    if (periodDate == null) {
      return;
    } else {
      setState(() {
        periodDays = List.generate(
            periodLength,
            (i) => DateTime(
                periodDate.year, periodDate.month, periodDate.day + (i)));
      });
    }
    print(periodDays);
  }

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();

    periodCall();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
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
                setState(() {
                  _selectedDay = date;
                });
                widget.onDaySelected(user, date);
              },
              builders: CalendarBuilders(
                //day names
                dowWeekdayBuilder: (context, day) {
                  return Container(child: Center(child: Text(day)));
                },

                dayBuilder: (context, date, events) {
                  final anyPeriodDay = periodDays.any((DateTime day) =>
                      day.day == date.day && day.month == date.month);
                  if (date == _selectedDay) {
                    return Container(
                      margin: const EdgeInsets.all(4.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.pink[300],
                      ),
                      child: Center(
                        child: Text(
                          date.day.toString(),
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  } else if (anyPeriodDay) {
                    if (_controller.isToday(date)) {
                      return Container(
                        margin: const EdgeInsets.all(4.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.indigo[400],
                          // border:
                          //     Border.all(color: Colors.indigo[400], width: 3),
                        ),
                        child: Center(
                          child: Text(
                            date.day.toString(),
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.pink[400],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        color: Colors.grey[50],
                        width: 50,
                        height: 50,
                        child: Center(
                          child: Text(
                            date.day.toString(),
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.pink[400],
                            ),
                          ),
                        ),
                      );
                    }
                  } else {
                    if (_controller.isToday(date)) {
                      return Container(
                        margin: const EdgeInsets.all(4.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.indigo[400],
                          shape: BoxShape.circle,
                          // border:
                          //     Border.all(color: Colors.indigo[400], width: 3),
                        ),
                        child: Center(
                          child: Text(
                            date.day.toString(),
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    } else if (_controller.focusedDay.month != date.month) {
                      return Container(
                        color: Colors.grey[50],
                        width: 50,
                        height: 50,
                        child: Center(
                          child: Text(
                            date.day.toString(),
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[400],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        color: Colors.grey[50],
                        width: 50,
                        height: 50,
                        child: Center(
                          child: Text(
                            date.day.toString(),
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.indigo[400],
                            ),
                          ),
                        ),
                      );
                    }
                  }
                },
                // // // markersBuilder: (context, date, events, holidays) {
                // // //   final children = <Widget>[];
                // // //   if (events.isNotEmpty) {
                // // //     children.add(
                // // //       Positioned(
                // // //         right: 1,
                // // //         bottom: 1,
                // // //         child: _buildEventsMarker(date, events),
                // // //       ),
                // // //     );
                // // //   }
                // // //   return children;
                // // // },
              ),
              calendarController: _controller,
            ),

            ///// le stooon de mapping events. of whats happening period ovulation etc
            ///
            // ..._selectedEvents.map(
            //   (event) => Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Container(
            //       height: MediaQuery.of(context).size.height / 20,
            //       width: MediaQuery.of(context).size.width / 2,
            //       decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(30),
            //           color: Colors.white,
            //           border: Border.all(color: Colors.grey)),
            //       child: Center(
            //         child: Text(
            //           event,
            //           style: TextStyle(
            //               color: Colors.blue,
            //               fontWeight: FontWeight.bold,
            //               fontSize: 16),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
