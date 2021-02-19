import 'package:flutter/material.dart';
import 'package:menstruating/pages/components/calendrier.dart';
import 'package:menstruating/pages/components/numbersList.dart';

class Page {
  final String intro, question;
  final ListBody listbody;
  final int id;
  final calendar;
  final NumbersList numbersList;
  Page(
      {this.question,
      this.id,
      this.listbody,
      this.intro,
      this.calendar,
      this.numbersList});
}

List<Page> pages = [
  Page(
      id: 0,
      intro:
          "To predict period accurately,\n it would be better if you answer 3 questions.",
      question: "On average, how long is your period?",
      listbody: ListBody(
        children: [
          Text(
              "Period lenght means bleeding days, which usually lasts between 3-7 days."),
          Divider(),
          Text(
            "The period lenght you selected will be used to predict your next period lenght.",
          ),
        ],
      ),
      numbersList: NumbersList(
        numbermax: 14,
        numbermin: 2,
      )),
  Page(
    id: 1,
    question: "On average, how long is your period cycle?",
    listbody: ListBody(
      children: [
        Text(
            "Cycle lenght means the duration of two dates of period start, usually 21-36 days."),
        Divider(),
        Text(
          "The cycle lenght you selected will be used to predict your next cycle lenght.",
        ),
      ],
    ),
    numbersList: NumbersList(
      numbermax: 100,
      numbermin: 15,
    ),
  ),
  Page(
    id: 2,
    question: "When did your last period start?",
    listbody: ListBody(
      children: [
        Text(
            "Scroll to change the month, and tap to select the start date of your last period."),
        Divider(),
        Text(
          "The date you selected will be used to predict your next period lenght.",
        ),
      ],
    ),
    calendar: Calendar(),
  ),
];
