import 'package:flutter/material.dart';
import 'package:menstruating/models/user.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  final Function onDaySelected;

  final periodLength;
  final periodCycle;
  final periodTS;

  const Calendar(
      {Key key,
      this.onDaySelected,
      this.periodCycle,
      this.periodTS,
      this.periodLength})
      : super(key: key);
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarController _controller;
  DateTime _selectedDay;

  List<DateTime> periodDays;
  DateTime ovulationDay;
  DateTime periodDate;

  periodCall() {
    if (widget.periodTS == null) {
      setState(() {
        periodDays = null;
      });
    } else {
      setState(() {
        DateTime periodDate = new DateTime.fromMicrosecondsSinceEpoch(
            widget.periodTS.microsecondsSinceEpoch);
        periodDays = List.generate(
          widget.periodLength,
          (i) => DateTime(
            periodDate.year,
            periodDate.month,
            periodDate.day + (i),
          ),
        );
        ovulationDay =
            periodDate.add(new Duration(days: widget.periodCycle - 14));
      });
    }

    print('period days are $periodDays');
    print('ovulation day is $ovulationDay');
    print(widget.periodCycle - 14);
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

    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
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
                  var anyPeriodDay = [
                    for (var day in periodDays)
                      if (date.difference(day).inDays % widget.periodCycle ==
                          day.difference(periodDate))
                        date
                  ];

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
                  } else if (anyPeriodDay.contains(date)) {
                    if (_controller.isToday(date)) {
                      return Container(
                        margin: const EdgeInsets.all(4.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.indigo[400],
                          border: Border.all(color: Colors.pink[300], width: 6),
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
                    } else if (date == ovulationDay) {
                      return Stack(children: [
                        Container(
                          color: Colors.grey[50],
                          width: 50,
                          height: 50,
                          child: Center(
                            child: Text(
                              date.day.toString(),
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.pink[400],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 1,
                          bottom: 1,
                          height: 10,
                          width: 10,
                          child: Icon(
                            Icons.favorite,
                            color: Colors.green,
                          ),
                        ),
                      ]);
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
              ),
              calendarController: _controller,
            ),

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
