import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DailyStatistics extends StatefulWidget {
  const DailyStatistics({Key? key}) : super(key: key);

  @override
  _DailyStatisticsState createState() => _DailyStatisticsState();
}

class _DailyStatisticsState extends State<DailyStatistics> {
  DateTime date = DateTime.now();

  Future<Null> selectTimePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(1940),
        lastDate: DateTime(2021));
    if (picked != null && picked != date) {
      setState(() {
        date = picked;
        print(date.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Statistics",
          style: TextStyle(color: Color(0xFF00D9B1), fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
                color: Colors.cyan,
                textColor: Colors.white,
                onPressed: () {
                  // print("hello");
                  selectTimePicker(context);
                },
                child: Text("Pick Date")),
            Text(date.day.toString()),
            Text(date.month.toString()),
            Text(date.year.toString()),
          ],
        ),
      ),
    );
  }
}
